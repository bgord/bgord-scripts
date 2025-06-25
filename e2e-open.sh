#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config
set_node_timezone_to_utc

info "Opening E2E tests..."

bunx playwright install
bunx playwright test --reporter null --ui --pass-with-no-tests
