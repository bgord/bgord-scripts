import { readdir, readFile } from "node:fs/promises";
import { CoverageReport } from "monocart-coverage-reports";

const RAW_DIR = "reports/e2e-coverage-raw";
const THRESHOLD = 99.5;

const report = new CoverageReport({
  name: "E2E frontend coverage",
  outputDir: "reports/e2e-coverage",
  reports: [
    ["v8", { metrics: ["statements"] }],
    ["console-details", { metrics: ["statements"], skipPercent: 100 }],
  ],
  sourceMapResolver: async (url) => JSON.parse(await readFile(new URL(url).pathname.slice(1), "utf8")),
  sourceFilter: (sourcePath) => !sourcePath.includes("node_modules"),
  sourcePath: (filePath) => filePath.replace(/^(\.\.\/)+/, ""),
});

const sources = new Map<string, string>();

for (const file of await readdir(RAW_DIR)) {
  const entries: Array<{ url: string; source?: string }> = JSON.parse(
    await readFile(`${RAW_DIR}/${file}`, "utf8"),
  );
  const bundled = entries.filter((entry) => /^\/public\/.+\.js$/.test(URL.parse(entry.url)?.pathname ?? ""));

  for (const entry of bundled) {
    const path = new URL(entry.url).pathname.slice(1);
    if (!sources.has(path)) sources.set(path, await readFile(path, "utf8"));
    entry.source = sources.get(path);
  }

  if (bundled.length > 0) await report.add(bundled);
}

const results = await report.generate();
const statements = results?.summary.statements.pct ?? 0;

if (statements < THRESHOLD) {
  console.error(`E2E statement coverage ${statements}% is below ${THRESHOLD}%`);
  process.exit(1);
}
