#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Watching and rebuilding frontend..."

BUILD_VERSION=\"v$(node -p -e "require('./package.json').version")\"
BUILD_DATE=$(date +"%s")

bun build frontend/index.tsx \
  --outdir static/ \
  --watch \
  --define BUILD_VERSION=$BUILD_VERSION \
  --define BUILD_DATE=$BUILD_DATE \
  $@
