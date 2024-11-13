#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Running test server..."

if test -f "scripts/test-server-start.sh"
then
  info "Test server start script exists"
  bash scripts/test-server-start.sh
  exit
else
  info "Test server start script does not exist"
fi

info "Environment: test"
info "Starting project..."

# ==========================================================

./bgord-scripts/bun-prisma-reset.sh
info "Migrations reset"

# ==========================================================

cp node_modules/@bgord/design/dist/main.min.css static/
cp node_modules/@bgord/design/dist/normalize.min.css static/
info "Copied CSS from @bgord/design"

# ==========================================================

./bgord-scripts/bun-frontend-build.sh
info "Built frontend"

# ==========================================================

export NODE_ENV="test"

bun run \
  --watch \
  --env-file=".env.$NODE_ENV" \
  index.ts
