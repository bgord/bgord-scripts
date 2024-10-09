#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Linting all files..."

bunx @biomejs/biome lint --config-path=bgord-scripts/templates/biome.json .

success "Files are correct!"
