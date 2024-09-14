#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Detecting unused code..."

npx knip --strict --config bgord-scripts/knip.json
