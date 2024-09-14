module.exports = {
  extends: ["@commitlint/config-conventional"],
  rules: {
    "type-enum": [
      2,
      "always",
      ["feature", "fix", "step", "docs", "refactor", "style", "test"],
    ],
    "scope-enum": [2, "always", ["release", "model", "api", "ui", "scripts"]],
  },
};
