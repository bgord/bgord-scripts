#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Environment: production"
info "Building frontend..."

BUILD_VERSION=\"$(node -p -e "require('./package.json').version")\"
BUILD_DATE=$(date +"%s")

bun build frontend/index.tsx \
  --minify \
  --target=browser \
  --tree-shaking \
  --splitting \
  --chunks \
  --sourcemap=none \
  --define process.env.NODE_ENV=\"production\" \
  --define 'console.log=undefined' \
  --define 'console.debug=undefined' \
  --define 'console.info=undefined' \
  --no-summary \
  --jsx-optimize \
  --define BUILD_VERSION=$BUILD_VERSION \
  --define BUILD_DATE=$BUILD_DATE \
  --outdir static/ \
  $@

success "Frontend built!"
