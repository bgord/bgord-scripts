import { defineConfig } from "drizzle-kit";

export default defineConfig({
  dialect: "sqlite",
  schema: "./infra/schema.ts",
  out: "./infra/drizzle",
  dbCredentials: { url: "file:./sqlite.db" },
});
