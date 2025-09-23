#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config
set_node_timezone_to_utc

export NODE_ENV="test"

info "Test watch..."

if test -f "tests/_setup.ts"
then
  bun test --watch --preload ./tests/_setup.ts tests/
else
  bun test --watch tests/
fi
