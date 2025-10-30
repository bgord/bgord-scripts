#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Environment: production"

step_start "Remove public artifacts"
rm -f public/*.js
rm -f public/*.js.map
step_end "Remove public artifacts"

step_start "CSS copy"
cp node_modules/@bgord/design/dist/main.min.css public
step_end "CSS copy"

step_start "Frontend build"
bun build web/entry-client.tsx \
  --outdir ./public \
  --target browser \
  --splitting \
  --minify \
  --production \
  --define process.env.NODE_ENV=\"production\"
step_end "Frontend build"
