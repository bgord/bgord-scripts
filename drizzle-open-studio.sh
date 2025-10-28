#!/usr/bin/env bash

step_start "Drizzle open studio"
bunx drizzle-kit studio --config bgord-scripts/templates/drizzle.config.ts
step_end "Drizzle open studio"
