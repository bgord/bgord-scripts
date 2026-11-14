import { brotliCompressSync } from "node:zlib";

const DIRECTORY = "output/public";
const PATTERN = "*.{js,css,html}";

for await (const path of new Bun.Glob(PATTERN).scan({ cwd: DIRECTORY, absolute: true })) {
  const file = await Bun.file(path).bytes();

  await Bun.write(`${path}.br`, brotliCompressSync(file));
}
