#!/usr/bin/env bash

if ! test -d "infra/drizzle"
then
  info "Database not set up"
  exit 0
fi

step_start "Drizzle open studio"
bunx drizzle-kit studio --config bgord-scripts/templates/drizzle.config.ts
step_end "Drizzle open studio"
