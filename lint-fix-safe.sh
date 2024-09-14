#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Fixing safe lint errors..."

npx @biomejs/biome lint --config-path=bgord-scripts/biome.json --apply .

success "Safe lint errors fixed!"
