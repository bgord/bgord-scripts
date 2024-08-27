#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

info "Environment: production"

info "Building frontend..."

BUILD_VERSION=\"$(node -p -e "require('./package.json').version")\"
BUILD_DATE=$(date +"%s")

npx esbuild frontend/index.tsx \
  --bundle \
  --minify \
  --define:BUILD_VERSION=$BUILD_VERSION \
  --define:BUILD_DATE=$BUILD_DATE \
  --outdir=static/ \
  $@
