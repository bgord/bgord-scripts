import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  base: "/public/",
  publicDir: false,
  plugins: [react({ jsxRuntime: "automatic" })],
  resolve: { dedupe: ["react", "react-dom", "@tanstack/react-router"] },
  define: { "process.env.NODE_ENV": '"production"', __DEV__: "false" },
  esbuild: { legalComments: "none" },
  build: {
    outDir: "public",
    emptyOutDir: false,
    target: "es2022",
    reportCompressedSize: false,
    sourcemap: false,
    modulePreload: { polyfill: false },
    assetsInlineLimit: 0,
    minify: "terser",
    terserOptions: {
      module: true,
      compress: {
        passes: 3,
        drop_console: true,
        drop_debugger: true,
        pure_funcs: ["console.info", "console.debug", "console.trace"],
      },
      mangle: { properties: { regex: /^_/ } },
      format: { comments: false },
    },
    assetsDir: "",
    rollupOptions: {
      input: "web/entry-client.tsx",
      output: {
        entryFileNames: "entry-client.js",
        chunkFileNames: "[name]-[hash].js",
        manualChunks(id) {
          if (id.includes("node_modules")) return "vendor";
        },
      },
      treeshake: {
        moduleSideEffects: false,
        propertyReadSideEffects: false,
        tryCatchDeoptimization: false,
        unknownGlobalSideEffects: false,
      },
      preserveEntrySignatures: "exports-only",
    },
  },
});
