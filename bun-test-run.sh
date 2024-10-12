#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config
set_node_timezone_to_utc

export NODE_ENV="test"

info "Running tests..."

bun test

success "Tests passed!"
