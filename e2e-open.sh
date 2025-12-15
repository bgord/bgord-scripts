#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

if test -d "infra/e2e"
then
  info "E2E tests available"
else
  info "E2E tests not available"
  exit 0
fi

set_node_timezone_to_utc

step_start "E2E open"
export PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS=1
bunx playwright install chromium
bunx playwright test --reporter null --ui --pass-with-no-tests
step_end "E2E open"
