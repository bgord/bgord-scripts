#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config
set_node_timezone_to_utc

step_start "E2E open"
export PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS=1
bunx playwright install chromium
bunx playwright test --reporter null --ui --pass-with-no-tests
step_end "E2E open"
