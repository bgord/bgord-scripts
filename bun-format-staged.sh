#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Formatting all staged files..."

npx @biomejs/biome format \
  --write \
  --staged \
  --no-errors-on-unmatched \
  --config-path=bgord-scripts/templates/biome.json

success "Staged files formatted successfully!"
