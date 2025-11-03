#!/usr/bin/env bash

ensure_drizzle_set_up

step_start "Drizzle open studio"
bunx drizzle-kit studio --config bgord-scripts/templates/drizzle.config.ts
step_end "Drizzle open studio"
