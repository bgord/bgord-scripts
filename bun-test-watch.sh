#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config
set_node_timezone_to_utc

info "Running bun tests in watch mode..."

bun test --watch
