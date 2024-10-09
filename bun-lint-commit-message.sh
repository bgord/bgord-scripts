#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Linting commit message..."

bunx commitlint --edit --config bgord-scripts/templates/.commitlint-config.js

success "Commit message is correct!"
