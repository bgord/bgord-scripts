import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  base: "/public/",
  publicDir: false,
  plugins: [react({ jsxRuntime: "automatic" })],
  resolve: {
    dedupe: ["react", "react-dom", "@tanstack/react-router", "@tanstack/router-core"],
  },
  define: { "process.env.NODE_ENV": '"production"', __DEV__: "false" },
  build: {
    outDir: "public",
    emptyOutDir: false,
    target: "es2022",
    reportCompressedSize: false,
    sourcemap: false,
    modulePreload: { polyfill: false },
    assetsInlineLimit: 0,
    assetsDir: "",
    rolldownOptions: {
      input: "web/entry-client.tsx",
      output: {
        entryFileNames: "entry-client.js",
        chunkFileNames: "[name]-[hash].js",
      },
      preserveEntrySignatures: "exports-only",
    },
  },
});
