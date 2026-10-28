import { readdir } from "node:fs/promises";

const MODULES_DIR = "modules";
const IMPORT = /from "\+([a-z-]+)[/"]/g;

const entries = await readdir(MODULES_DIR, { withFileTypes: true });
const modules = entries.map((entry) => entry.name.replace(/\.ts$/, "")).sort();

const edges = new Set<string>();
const connected = new Set<string>();

for (const entry of entries) {
  const from = entry.name.replace(/\.ts$/, "");
  const files = entry.isDirectory()
    ? Array.from(new Bun.Glob("**/*.ts").scanSync(`${MODULES_DIR}/${entry.name}`)).map(
        (file) => `${MODULES_DIR}/${entry.name}/${file}`,
      )
    : [`${MODULES_DIR}/${entry.name}`];

  for (const file of files) {
    for (const [, to] of (await Bun.file(file).text()).matchAll(IMPORT)) {
      if (!to || to === from || !modules.includes(to)) continue;
      edges.add(`  ${from} --> ${to}`);
      connected.add(from).add(to);
    }
  }
}

const isolated = modules.filter((module) => !connected.has(module)).map((module) => `  ${module}`);

console.log(["```mermaid", "graph LR", ...isolated, ...Array.from(edges).sort(), "```"].join("\n"));
