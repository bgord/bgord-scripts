#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

set_node_timezone_to_utc

export E2E_COVERAGE=1
export E2E_COVERAGE_RAW_DIR="reports/e2e-coverage-raw"

rm -rf reports/e2e-coverage "$E2E_COVERAGE_RAW_DIR"
mkdir -p "$E2E_COVERAGE_RAW_DIR"

step_start "E2E coverage run"
export PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS=1
bunx playwright install chromium
E2E_EXIT_CODE=0
bunx playwright test --reporter list --timeout 20000 "$@" || E2E_EXIT_CODE=$?
step_end "E2E coverage run"

step_start "E2E coverage report"
bun bgord-scripts/e2e-coverage-report.ts
step_end "E2E coverage report"

exit "$E2E_EXIT_CODE"
