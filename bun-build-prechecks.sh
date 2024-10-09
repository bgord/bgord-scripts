#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Running build prechecks..."

./bgord-scripts/bun-typecheck.sh
./bgord-scripts/bun-lint.sh
./bgord-scripts/bun-test-run.sh
./bgord-scripts/bun-cspell.sh
./bgord-scripts/bun-shellcheck.sh
./bgord-scripts/bun-e2e-run.sh
