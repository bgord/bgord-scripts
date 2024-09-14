#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

set_node_timezone_to_utc

info "Opening E2E..."

npx playwright install
npx playwright test --reporter null --ui --pass-with-no-tests
