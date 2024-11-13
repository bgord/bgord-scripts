#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Linting all files..."

bunx @biomejs/biome lint \
  --config-path=bgord-scripts/templates/biome.json \
  --no-errors-on-unmatched \
  .

success "Files are correct!"
