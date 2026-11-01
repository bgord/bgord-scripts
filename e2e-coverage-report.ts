import { readdir, readFile } from "node:fs/promises";

const RAW_DIR = "reports/e2e-coverage-raw";
const THRESHOLD = 99.5;
const BASE64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
const IGNORE_NEXT = /\/\*\s*v8 ignore next(?:\s+(\d+))?\s*\*\//;

type V8Range = { startOffset: number; endOffset: number; count: number };
type V8Entry = { url: string; functions: Array<{ ranges: Array<V8Range> }> };
type SourceMap = { sources: Array<string>; sourcesContent: Array<string>; mappings: string };

const bundles = new Map<string, { code: string; executed: Uint8Array }>();

for (const file of await readdir(RAW_DIR)) {
  const entries: Array<V8Entry> = JSON.parse(await readFile(`${RAW_DIR}/${file}`, "utf8"));

  for (const entry of entries) {
    const pathname = URL.parse(entry.url)?.pathname ?? "";
    if (!/^\/public\/.+\.js$/.test(pathname)) continue;

    const path = pathname.slice(1);
    if (!bundles.has(path)) {
      const code = await readFile(path, "utf8");
      bundles.set(path, { code, executed: new Uint8Array(code.length) });
    }
    const bundle = bundles.get(path)!;

    const counts = new Int32Array(bundle.code.length);
    const ranges = entry.functions
      .flatMap((fn) => fn.ranges)
      .sort((a, b) => a.startOffset - b.startOffset || b.endOffset - a.endOffset);
    for (const range of ranges) counts.fill(range.count, range.startOffset, range.endOffset);
    for (let offset = 0; offset < counts.length; offset++) if (counts[offset]! > 0) bundle.executed[offset] = 1;
  }
}

function decodeSegment(segment: string): Array<number> {
  const fields: Array<number> = [];
  let value = 0;
  let shift = 0;

  for (const char of segment) {
    const digit = BASE64.indexOf(char);
    value += (digit & 31) << shift;
    if (digit & 32) shift += 5;
    else {
      fields.push(value & 1 ? -(value >>> 1) : value >>> 1);
      value = 0;
      shift = 0;
    }
  }
  return fields;
}

function ignoredLines(content: string): Set<number> {
  const ignored = new Set<number>();
  content.split("\n").forEach((line, index) => {
    const match = IGNORE_NEXT.exec(line);
    if (!match) return;
    for (let next = 1; next <= Number(match[1] ?? 1); next++) ignored.add(index + 1 + next);
  });
  return ignored;
}

const lines = new Map<string, boolean>();

for (const [path, bundle] of bundles) {
  const map: SourceMap = JSON.parse(await readFile(`${path}.map`, "utf8"));
  const sourcePaths = map.sources.map((source) => source.replace(/^(\.\.\/)+/, ""));
  const ignored = map.sourcesContent.map((content) => ignoredLines(content ?? ""));

  const lineStarts = [0];
  for (let offset = 0; offset < bundle.code.length; offset++) {
    if (bundle.code[offset] === "\n") lineStarts.push(offset + 1);
  }

  let sourceIndex = 0;
  let sourceLine = 0;

  map.mappings.split(";").forEach((generated, generatedLine) => {
    let generatedColumn = 0;

    for (const segment of generated.split(",")) {
      if (!segment) continue;
      const fields = decodeSegment(segment);
      generatedColumn += fields[0]!;
      if (fields.length < 4) continue;
      sourceIndex += fields[1]!;
      sourceLine += fields[2]!;

      const sourcePath = sourcePaths[sourceIndex]!;
      if (sourcePath.includes("node_modules")) continue;
      if (ignored[sourceIndex]!.has(sourceLine + 1)) continue;

      const key = `${sourcePath}:${sourceLine + 1}`;
      const executed = bundle.executed[lineStarts[generatedLine]! + generatedColumn] === 1;
      lines.set(key, (lines.get(key) ?? false) || executed);
    }
  });
}

const uncovered = [...lines].filter(([, executed]) => !executed).map(([key]) => key);
const pct = Math.floor(((lines.size - uncovered.length) / lines.size) * 10000) / 100;

for (const key of uncovered.sort()) console.log(`uncovered ${key}`);
console.log(`E2E line coverage: ${pct}% (${lines.size - uncovered.length}/${lines.size})`);

if (pct < THRESHOLD) {
  console.error(`E2E line coverage ${pct}% is below ${THRESHOLD}%`);
  process.exit(1);
}
