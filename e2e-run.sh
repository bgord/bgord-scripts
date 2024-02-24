#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

set_node_timezone_to_utc

info "Running E2E..."

npx playwright test --reporter null
