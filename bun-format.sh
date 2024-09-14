#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Formatting all files..."
bunx pretty-quick

success "Files formatted successfully!"
