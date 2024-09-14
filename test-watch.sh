#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config
set_node_timezone_to_utc

info "Running tests in watch mode..."

npx vitest watch --passWithNoTests --exclude infra/e2e
