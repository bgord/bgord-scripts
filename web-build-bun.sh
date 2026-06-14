#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

ensure_web_set_up

info "Environment: production"

public_artifacts_remove

step_start "CSS copy"
cp node_modules/@bgord/design/dist/main.min.css public
step_end "CSS copy"

step_start "Web build bun"
bun build web/entry-client.tsx \
  --outdir ./public \
  --target browser \
  --splitting \
  --minify \
  --production \
  --define process.env.NODE_ENV=\"production\"
step_end "Web build bun"
