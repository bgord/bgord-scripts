#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Linting all files..."

bunx eslint . --ext .js,.tsx,.ts \
  --cache \
  --ignore-path bgord-scripts/.eslintignore \
  --config bgord-scripts/.eslint-config.json \
  --max-warnings 5 \
  --report-unused-disable-directives \
  $@

success "Files are corect!"
