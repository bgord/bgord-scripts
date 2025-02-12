#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config
set_node_timezone_to_utc

info "Running test coverage..."

bunx vitest run --passWithNoTests --exclude infra/e2e --coverage

success "Tests passed!"
