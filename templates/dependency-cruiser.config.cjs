/** @type {import('dependency-cruiser').IConfiguration} */
module.exports = {
  options: {
    includeOnly: "^(modules|app|infra)/",
    doNotFollow: { path: "node_modules" },

    // Use a minimal webpack config to resolve +aliases
    webpackConfig: { fileName: "./infra/depcruise.webpack.cjs" },
  },

  forbidden: [
    // modules → infra (runtime only; type-only imports allowed)
    {
      name: "no-modules-to-infra-runtime",
      severity: "error",
      from: { path: "^modules/" },
      to: {
        path: "^infra/",
        dependencyTypes: ["local", "core", "npm", "npm-dev", "npm-optional", "npm-peer"],
      },
    },

    // modules → app (runtime only; type-only imports allowed)
    {
      name: "no-modules-to-app-runtime",
      severity: "error",
      from: { path: "^modules/" },
      to: {
        path: "^app/",
        dependencyTypes: ["local", "core", "npm", "npm-dev", "npm-optional", "npm-peer"],
      },
    },

    // no cycles anywhere
    // {
    //   name: "no-cycles",
    //   severity: "error",
    //   from: {},
    //   to: { circular: true },
    // },
  ],
};
