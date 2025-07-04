#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

if test -f "scripts/local-server-start.sh"
then
  info "Local server start script exists"
  bash scripts/local-server-start.sh
  exit
else
  info "Local server start script does not exist"
fi

info "Environment: local"
info "Starting project..."

# ==========================================================

export NODE_ENV="local"

bun run \
  --watch \
  --env-file=".env.$NODE_ENV" \
  index.ts
