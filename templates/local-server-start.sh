#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

info "Environment: local"
info "Starting project..."

# ==========================================================

cp node_modules/@bgord/design/dist/main.min.css static/
cp node_modules/@bgord/design/dist/normalize.min.css static/
info "Copied CSS from @bgord/design"

# ==========================================================

./bgord-scripts/frontend-build.sh
info "Built frontend"

# ==========================================================

export NODE_ENV="local"

npx ts-node-dev \
  --respawn \
  --notify false \
  --prefer-ts \
  --ignore-watch node_modules \
  --ignore-watch frontend \
  --exit-child \
  --transpile-only \
  --rs \
  --watch '.env.local' \
  -- index.ts
