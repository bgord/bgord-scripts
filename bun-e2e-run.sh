#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

set_node_timezone_to_utc

if test -d "infra/e2e"
then
  info "Running E2E..."
else
  info "E2E tests not available"
  exit 1
fi

bunx playwright install
bunx playwright test --reporter null --pass-with-no-tests

success "E2E tests ran!"
