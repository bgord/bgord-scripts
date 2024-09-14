#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Running pre-commit hook..."

./bgord-scripts/bun-format-staged.sh
./bgord-scripts/bun-lint.sh
./bgord-scripts/bun-cspell.sh
./bgord-scripts/bun-shellcheck.sh

success "Pre-commit hook has finished!"
