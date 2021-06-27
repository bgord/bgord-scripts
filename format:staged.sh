#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

info "Formatting all staged files..."
npx pretty-quick --staged

success "Staged files formatted successfully!"
