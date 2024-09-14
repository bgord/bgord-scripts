#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Detecting unused code..."

npx knip --strict --config bgord-scripts/templates/knip.json

success "No unused code detected!"
