#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Running pre-push hook..."

./bgord-scripts/bun-typecheck.sh
./bgord-scripts/bun-prisma-validate.sh
./bgord-scripts/bun-typecheck-prune.sh
./bgord-scripts/bun-test-run.sh

success "Pre-push hook has finished!"
