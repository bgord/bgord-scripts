#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

info "Linting all files..."
npx eslint . --ext .js,.tsx,.ts --cache --ignore-path bgord-scripts/.eslintignore

success "Files are corect!"
