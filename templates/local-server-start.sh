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

npx gzip static/*.js --extension=gz --extension=br 2> /dev/null
npx gzip static/*.css --extension=gz --extension=br 2> /dev/null
npx gzip static/*.png --extension=gz --extension=br 2> /dev/null
info "Compressing static files"

# ==========================================================

export NODE_ENV="local"

npx ts-node-dev \
  --respawn \
  --notify false \
  --prefer-ts \
  --ignore-watch node_modules \
  -- index.ts
