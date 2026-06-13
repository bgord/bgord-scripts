#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

if test -f "scripts/server-start-test.sh"
then
  info "Server start test script exists"
  bash scripts/test-server-start.sh
  exit
else
  info "Server start test script does not exist"
fi

# ==========================================================

export NODE_ENV="test"

info "Environment: test"

./bgord-scripts/db-reset.sh
./bgord-scripts/db-seed-test.sh
./bgord-scripts/web-build-bun.sh

step_start "Server start test"
bun run \
  --watch \
  --env-file=".env.$NODE_ENV" \
  index.ts
step_end "Server start test"
