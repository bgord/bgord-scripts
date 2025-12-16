import { parseArgs } from "util";
import * as bg from "@bgord/bun";
import * as tools from "@bgord/tools";

const { values } = parseArgs({
  args: Bun.argv,
  options: {
    ["master-key"]: { type: "string" },
    ["input"]: { type: "string" },
    ["output"]: { type: "string" },
  },
  strict: true,
  allowPositionals: true,
});

(async function main() {
  const MasterKeyPath = tools.FilePathAbsolute.fromString(values["master-key"] as string);
  const CryptoKeyProvider = new bg.CryptoKeyProviderFileAdapter(MasterKeyPath);

  const Encryption = new bg.EncryptionBunAdapter({ CryptoKeyProvider });

  const input = tools.FilePathAbsolute.fromString(values.input as string);
  const output = tools.FilePathAbsolute.fromString(values.input as string);
  const recipe = { input, output };

  await Encryption.encrypt(recipe);
})();
