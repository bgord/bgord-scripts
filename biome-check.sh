#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Performing biome analysis..."

bunx @biomejs/biome check \
    --config-path=bgord-scripts/templates/biome.json \
    --no-errors-on-unmatched \
    --write \
    .

success "Biome analysis performed!"
