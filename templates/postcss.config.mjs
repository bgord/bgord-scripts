import purgecss from "@fullhuman/postcss-purgecss";

export default {
  plugins: [
    purgecss({
      content: ["web/**/*.{ts,tsx,jsx,js,html,hbs}", "public/**/*.html"],
      defaultExtractor: (content) => content.match(/[\w-/:%]+(?<!:)/g) || [],
      safelist: {
        standard: [
          "html",
          "a",
          "button",
          "ol",
          "ul",
          "menu",
          "summary",
          "img",
          "table",
          "input",
          "textarea",
          "meter",
          "pre",
          "output",
        ],
        deep: [
          /^:where\(/,
          /^\[hidden\]$/,
          /^\[contenteditable.*\]$/,
          /^\[draggable.*\]$/,
          /^::placeholder$/,
          /^::\-webkit\-details\-marker$/,
          /^dialog:modal$/,
        ],
      },
    }),
  ],
};
