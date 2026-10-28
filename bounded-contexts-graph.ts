import { readdir } from "node:fs/promises";

const MODULES_DIR = "modules";
const IMPORT = /from "\+([a-z-]+)[/"]/g;

const entries = await readdir(MODULES_DIR, { withFileTypes: true });
const modules = entries
  .filter((entry) => entry.isDirectory())
  .map((entry) => entry.name)
  .sort();

const edges = new Set<string>();
const connected = new Set<string>();

for (const from of modules) {
  for (const file of new Bun.Glob("**/*.ts").scanSync(`${MODULES_DIR}/${from}`)) {
    for (const [, to] of (await Bun.file(`${MODULES_DIR}/${from}/${file}`).text()).matchAll(IMPORT)) {
      if (!to || to === from || !modules.includes(to)) continue;
      edges.add(`  ${from} --> ${to}`);
      connected.add(from).add(to);
    }
  }
}

const isolated = modules.filter((module) => !connected.has(module)).map((module) => `  ${module}`);

console.log(["```mermaid", "graph LR", ...isolated, ...Array.from(edges).sort(), "```"].join("\n"));
