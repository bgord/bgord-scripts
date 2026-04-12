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

  const FileInspection = new bg.FileInspectionAdapter();
  const FileReaderText = new bg.FileReaderTextAdapter();
  const FileWriter = new bg.FileWriterAdapter();
  const FileReaderRaw = new bg.FileReaderRawAdapter();

  const CryptoKeyProvider = new bg.CryptoKeyProviderFileAdapter(MasterKeyPath, {
    FileInspection,
    FileReaderText,
  });

  const Encryption = new bg.EncryptionAesGcmAdapter({
    FileReaderRaw,
    FileWriter,
    CryptoKeyProvider,
    FileInspection,
  });

  const input = tools.FilePathAbsolute.fromString(values.input as string);
  const output = tools.FilePathAbsolute.fromString(values.output as string);
  const recipe = { input, output };

  await Encryption.encrypt(recipe);
})();
