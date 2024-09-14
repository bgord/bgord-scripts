#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Formatting all staged files..."
npx pretty-quick --staged

success "Staged files formatted successfully!"
