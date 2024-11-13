#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Fixing possible linting errors..."

bunx @biomejs/biome lint \
  --write \
  --unsafe \
  --config-path=bgord-scripts/templates/biome.json \
  .
