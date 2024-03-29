#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Detecting unused code..."

bunx ts-prune \
  | grep -v -e '(used in module)' \
    -e "db.ts" \
    -e "policies/index.ts" \
    -e "services/index.ts" \
    -e "value-objects/index.ts" \
    -e "infra/index.ts" \
  || true

bunx knip --strict --no-exit-code

# Force exit code 0
