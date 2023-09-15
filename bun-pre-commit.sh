#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Running pre-commit hook..."
./bgord-scripts/bun-format-staged.sh
./bgord-scripts/bun-lint.sh

success "Pre-commit hook has finished!"
