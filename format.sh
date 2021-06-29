#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Formatting all files..."
npx pretty-quick

success "Files formatted successfully!"
