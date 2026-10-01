#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

PROJECT_TO_RUN=$1

validate_non_empty "PROJECT_TO_RUN" "$PROJECT_TO_RUN"

shift

set_node_timezone_to_utc

step_start "E2E run project"
export PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS=1
bunx playwright install chromium
bunx playwright test --reporter list --project "$PROJECT_TO_RUN" "$@"
step_end "E2E run project"
