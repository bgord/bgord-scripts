#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

if test -f "scripts/test-server-start.sh"
then
  info "Test server start script exists"
  bash scripts/test-server-start.sh
  exit
else
  info "Test server start script does not exist"
fi

# ==========================================================

export NODE_ENV="test"

info "Environment: test"

./bgord-scripts/drizzle-reset.sh

./bgord-scripts/drizzle-seed.sh

info "Starting project..."

bun run \
  --watch \
  --env-file=".env.$NODE_ENV" \
  index.ts
