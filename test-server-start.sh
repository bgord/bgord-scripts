#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

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

./bgord-scripts/prisma-reset.sh
info "Migrations reset"

# ==========================================================

cp node_modules/@bgord/design/dist/main.min.css static/
cp node_modules/@bgord/design/dist/normalize.min.css static/
info "Copied CSS from @bgord/design"

# ==========================================================

./bgord-scripts/frontend-build.sh
info "Built frontend"

# ==========================================================

export NODE_ENV="test"

npx tsx watch \
  --clear-screen=false \
  --ignore frontend \
  --ignore node_modules \
  index.ts
