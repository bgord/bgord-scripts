#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Running commit-msg hook..."
./bgord-scripts/lint-commit-message.sh

success "Commit-msg hook has finished!"
