#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Running pre-commit hook..."
./bgord-scripts/format-staged.sh
./bgord-scripts/lint.sh
./bgord-scripts/cspell.sh
./bgord-scripts/shellcheck.sh

success "Pre-commit hook has finished!"
