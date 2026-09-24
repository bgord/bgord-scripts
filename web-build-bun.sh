#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

ensure_web_set_up

info "Environment: production"

ENTRY="web/entry-client.tsx"

HASH_FLAGS=()
if test "${NODE_ENV:-}" == "production"
then
  HASH_FLAGS=(--entry-naming "[name]-[hash].[ext]" --metafile=meta.web.json)
fi

public_artifacts_remove
bgord_design_copy

step_start "Web build bun"
bun build "$ENTRY" \
  --outdir ./public \
  --target browser \
  --splitting \
  --minify \
  --production \
  --define process.env.NODE_ENV=\"production\" \
  "${HASH_FLAGS[@]}"
step_end "Web build bun"
