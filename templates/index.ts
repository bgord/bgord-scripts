import express from "express";

import * as bg from "@bgord/node";

import { Env } from "./env";

const app = express();

bg.addExpressEssentials(app);

app.get("/", (_request, response) =>
  response.send({
    message: "Hello from @bgord/node!",
  })
);

const server = app.listen(Env.PORT, () =>
  bg.Reporter.info(`Server running on port: ${Env.PORT}`)
);

bg.GracefulShutdown.applyTo(server);
