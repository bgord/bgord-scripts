#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

if test -f "scripts/server-start-local.sh"
then
  info "Server start local script exists"
  bash scripts/server-start-local.sh
  exit
else
  info "Server start local script does not exist"
fi

info "Environment: local"

# ==========================================================

export NODE_ENV="local"

step_start "Server start local"
bun run \
  --watch \
  --env-file=".env.$NODE_ENV" \
  index.ts
step_end "Server start local"
