#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Linting commit message..."
npx commitlint --edit --config bgord-scripts/.commitlint-config.js

success "Commit message is correct!"
