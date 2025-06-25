#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Running build prechecks..."

./bgord-scripts/typecheck.sh
./bgord-scripts/lint.sh
./bgord-scripts/test-run.sh
./bgord-scripts/cspell.sh
./bgord-scripts/shellcheck.sh
./bgord-scripts/e2e-run.sh
