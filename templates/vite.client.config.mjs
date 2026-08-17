import { defineConfig } from "vite";

export default defineConfig({
  base: "/public/",
  publicDir: false,
  resolve: {
    dedupe: ["react", "react-dom", "@tanstack/react-router", "@tanstack/router-core"],
  },
  build: {
    outDir: "public",
    emptyOutDir: false,
    target: "es2022",
    reportCompressedSize: false,
    assetsDir: "",
    rolldownOptions: {
      input: "web/entry-client.tsx",
      output: {
        entryFileNames: "entry-client.js",
        chunkFileNames: "[name]-[hash].js",
        minify: { compress: { dropConsole: true }, mangle: true, codegen: true },
      },
    },
  },
});
