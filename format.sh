#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Formatting all files..."

npx pretty-quick

success "Files formatted successfully!"
