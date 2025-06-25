#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Formatting all files..."

npx @biomejs/biome format --write --config-path=bgord-scripts/templates/biome.json

success "Files formatted successfully!"
