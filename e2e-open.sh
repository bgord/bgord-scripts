#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config
set_node_timezone_to_utc

step_start "E2E open"
bunx playwright install --with-deps chromium
bunx playwright test --reporter null --ui --pass-with-no-tests
step_end "E2E open"
