#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Running bun tests in watch mode..."

bun test --watch
