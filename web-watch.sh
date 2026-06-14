#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

ensure_web_set_up

info "Environment: local"

public_artifacts_remove
bgord_design_copy

step_start "Web watch"
bun build ./web/entry-client.tsx \
  --outdir ./public \
  --target browser \
  --splitting \
  --sourcemap \
  --watch
step_end "Web watch"
