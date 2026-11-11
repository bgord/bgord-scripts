import path from "node:path";
import { API } from "typescript/unstable/async";

const api = new API();
const snapshot = await api.updateSnapshot({ openProjects: [path.resolve("tsconfig.json")] });

let count = 0;

for (const project of snapshot.getProjects()) {
  for (const diagnostic of await project.program.getSuggestionDiagnostics()) {
    if (!diagnostic.reportsDeprecated || !diagnostic.fileName) continue;

    const content = await Bun.file(diagnostic.fileName).text();
    const lines = content.slice(0, diagnostic.pos).split("\n");
    const location = `${path.relative(process.cwd(), diagnostic.fileName)}:${lines.length}:${lines.at(-1)!.length + 1}`;

    console.log(`${location} ${diagnostic.text}`);
    count++;
  }
}

await api.close();

if (count > 0) {
  console.log(`Found ${count} deprecated usage(s)`);
  process.exit(1);
}
