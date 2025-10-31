import purgecss from "@fullhuman/postcss-purgecss";

const keepResetLayer = () => ({
  postcssPlugin: "keep-reset-layer",
  AtRule: {
    layer(atRule) {
      if ((atRule.params || "").trim() === "reset") {
        // no need to import 'postcss'—node objects can be plain
        atRule.before({ type: "comment", text: "purgecss start ignore" });
        atRule.after({ type: "comment", text: "purgecss end ignore" });
      }
    },
  },
});
keepResetLayer.postcss = true;

function dataAttributeAwareExtractor(content) {
  const tokens = content.match(/[\w-/:%]+(?<!:)/g) || [];
  const attrMatches = content.matchAll(/data-[a-z0-9-]+(?:=(?:"[^"]*"|'[^']*'))?/gi);

  const attrs = [];
  for (const m of attrMatches) {
    const raw = m[0];
    attrs.push(raw, `[${raw}]`);
    const name = raw.split("=")[0];
    if (name) attrs.push(name, `[${name}]`);
  }
  return [...tokens, ...attrs];
}

export default {
  plugins: [
    keepResetLayer,

    purgecss({
      content: [
        "web/**/*.{ts,tsx,jsx,js,html,hbs}",
        "public/**/*.html",
        "node_modules/@bgord/ui/**/*.{ts,tsx,jsx,js}",
      ],
      defaultExtractor: dataAttributeAwareExtractor,
    }),
  ],
};
