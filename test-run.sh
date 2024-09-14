#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config
set_node_timezone_to_utc

info "Running tests..."

npx vitest run --passWithNoTests --exclude infra/e2e

success "Tests passed!"
