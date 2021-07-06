#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

OUTPUT_PATH=$1

info "Setting up HTML file..."
validate_non_empty "OUTPUT_PATH" "$OUTPUT_PATH"

cp bgord-scripts/templates/index.html "$OUTPUT_PATH"

success "HTML file set up!"
