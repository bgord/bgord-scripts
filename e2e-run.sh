#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config
set_node_timezone_to_utc

if test -d "infra/e2e"
then
  info "E2E tests available"
else
  info "E2E tests not available"
  exit 0
fi

step_start "E2E run"
bunx playwright install --with-deps chromium
bunx playwright test --reporter null --pass-with-no-tests
step_end "E2E run"
