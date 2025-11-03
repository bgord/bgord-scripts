#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

if ! test -d "infra/drizzle"
then
  info "Database not set up"
  exit 0
fi

export NODE_ENV="test"

step_start "Drizzle seed test"
bun scripts/db-seed.ts
step_end "Drizzle seed test"
