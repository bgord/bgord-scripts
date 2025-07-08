#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config
set_node_timezone_to_utc

info "Running test coverage..."

if test -f "tests/_setup.ts"
then
  bun test --coverage --preload ./tests/_setup.ts tests/
else
  bun test --coverage tests/
fi

success "Tests passed!"
