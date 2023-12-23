#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Detecting unused code..."

npx knip --strict --no-exit-code --config bgord-scripts/knip.json
