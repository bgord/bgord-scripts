#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

set_node_timezone_to_utc

info "Running tests..."

npx vitest run --passWithNoTests --exclude infra/e2e
