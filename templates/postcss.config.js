const purgecss = require("@fullhuman/postcss-purgecss");

module.exports = {
  plugins: [
    purgecss({
      content: ["**/*.tsx", "**/*.html", "**/*.hbs"],
      defaultExtractor: (content) => content.match(/[\w-/:%]+(?<!:)/g) || [],
    }),
  ],
};
