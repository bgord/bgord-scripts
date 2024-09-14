#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Detecting unused code..."

bunx knip --strict --config bgord-scripts/knip.json

success "No unused code detected!"
