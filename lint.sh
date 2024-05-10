#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Linting all files..."

npx @biomejs/biome lint --config-path=bgord-scripts/biome.json .

success "Files are correct!"
