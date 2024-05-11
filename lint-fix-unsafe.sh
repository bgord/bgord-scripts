#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Fixing unsafe lint errors..."

npx @biomejs/biome lint --config-path=bgord-scripts/biome.json --apply-unsafe .

success "Unsafe lint errors fixed!"
