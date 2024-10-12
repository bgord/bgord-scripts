#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

if test -f "scripts/bun-local-server-start.sh"
then
  info "Bun local server start script exists"
  bash scripts/bun-local-server-start.sh
  exit
else
  info "Bun local server start script does not exist"
fi

info "Environment: local"
info "Starting bun project..."

# ==========================================================

if test -f "static/"
then
  cp node_modules/@bgord/design/dist/main.min.css static/
  cp node_modules/@bgord/design/dist/normalize.min.css static/
  info "Copied CSS from @bgord/design"
fi

# ==========================================================

if test -f "frontend/"
then
  ./bgord-scripts/frontend-build.sh
  info "Built frontend"
fi

# ==========================================================

export NODE_ENV="local"

bun run \
  --watch \
  --env-file=".env.$NODE_ENV" \
  index.ts
