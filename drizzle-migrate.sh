#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

if ! test -d "infra/drizzle"
then
  info "Database not set up"
  exit 0
fi

step_start "Drizzle migrate"
bunx drizzle-kit migrate --config bgord-scripts/templates/drizzle.config.ts
step_end "Drizzle migrate"
