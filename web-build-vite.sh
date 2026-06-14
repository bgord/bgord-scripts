#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

ensure_web_set_up

info "Environment: production"

public_artifacts_remove

step_start "CSS copy"
cp node_modules/@bgord/design/dist/main.min.css public
step_end "CSS copy"

step_start "Web build vite"
bunx vite build --config bgord-scripts/templates/vite.client.config.mjs --mode production
step_end "Web build vite"
