#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

ensure_web_set_up

info "Environment: production"

public_artifacts_remove
bgord_design_copy

COVERAGE_FLAGS=(--minify --production)
if test -n "${E2E_COVERAGE:-}"
then
  info "Coverage build: linked sourcemaps, no minification (E2E_COVERAGE)"
  COVERAGE_FLAGS=(--sourcemap=linked)
fi

step_start "Web build bun"
bun build web/entry-client.tsx \
  --outdir ./public \
  --target browser \
  --splitting \
  "${COVERAGE_FLAGS[@]}" \
  --define process.env.NODE_ENV=\"production\"
step_end "Web build bun"
