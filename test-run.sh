#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config
set_node_timezone_to_utc

export NODE_ENV="test"

info "Running tests..."

if test -f "tests/_setup.ts"
then
  bun test --preload ./tests/_setup.ts
else
  bun test
fi
