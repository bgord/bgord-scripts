#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Running pre-push hook..."
./bgord-scripts/typecheck.sh
./bgord-scripts/prisma-validate.sh
./bgord-scripts/typecheck-prune.sh
./bgord-scripts/test-run.sh

success "Pre-push hook has finished!"
