#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Environment: local"

step_start "Remove public artifacts"
rm -f public/*.js
rm -f public/*.js.map
step_end "Remove public artifacts"

step_start "CSS copy"
cp node_modules/@bgord/design/dist/main.min.css public
step_end "CSS copy"

step_start "Frontend watch"
bun build ./web/entry-client.tsx \
  --outdir ./public \
  --target browser \
  --splitting \
  --sourcemap \
  --watch
step_end "Frontend watch"
