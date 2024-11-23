import fs from "node:fs/promises";
import path from "node:path";
import { brotliCompressSync } from "node:zlib";

async function compressDirectory(
  dir: string,
  extensions: string[] = [".html", ".css", ".js", ".png", ".ico"],
) {
  const results = [];

  for await (const filepath of walker(dir, extensions)) {
    const content = await fs.readFile(filepath);
    const originalSize = content.length;

    try {
      const gzipped = Bun.gzipSync(content);
      const brotlied = brotliCompressSync(content);

      await Promise.all([fs.writeFile(`${filepath}.gz`, gzipped), fs.writeFile(`${filepath}.br`, brotlied)]);

      const result = new CompressionResult({
        originalSize,
        file: path.relative(dir, filepath),
        gzipSize: gzipped.byteLength,
        brotliSize: brotlied.length,
      });
      result.print();

      results.push(result);
    } catch (error) {
      console.error(`Failed to compress ${filepath}:`, error);
    }
  }

  if (results.length === 0) {
    console.log(`No matching files found in ${dir}`);
  }

  return results;
}

class CompressionResult {
  constructor(
    private output: {
      originalSize: number;
      file: string;
      gzipSize: number;
      brotliSize: number;
    },
  ) {}

  print(): void {
    const original = this.humanify(this.output.originalSize);
    const gzipSize = this.humanify(this.output.gzipSize);
    const gzipChange = this.compare(this.output.gzipSize, this.output.originalSize);
    const brotliSize = this.humanify(this.output.brotliSize);
    const brotliChange = this.compare(this.output.brotliSize, this.output.originalSize);

    console.log(`${this.output.file}: ${original}`);
    console.log(` → .gz: ${gzipSize} → (${gzipChange} %)`);
    console.log(` → .br: ${brotliSize} → (${brotliChange} %)\n`);
  }

  private humanify(value: number): string {
    return `${(value / 1024).toFixed(2)} KB`;
  }

  private compare(one: number, another: number) {
    return ((one / another) * 100).toFixed(1);
  }
}

async function* walker(dir: string, extensions: string[]): AsyncGenerator<string> {
  const entries = await fs.readdir(dir, { withFileTypes: true });

  for (const entry of entries) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      yield* walker(fullPath, extensions);
    } else if (entry.isFile() && extensions.includes(path.extname(entry.name))) {
      yield fullPath;
    }
  }
}

// Handle CLI
// @ts-ignore
if (import.meta.main) {
  const args = process.argv.slice(2);

  const dir = args[0] || "./build/static";
  const extensions = args[1]?.split(",") || [".html", ".css", ".js", ".png", ".ico"];

  console.log(`Compressing ${dir} (${extensions})...\n`);

  try {
    // @ts-ignore
    await compressDirectory(dir, extensions);
  } catch (error) {
    console.error("Error:", error instanceof Error ? error.message : error);
    process.exit(1);
  }
}
