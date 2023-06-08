#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Detecting unused code..."

npx ts-prune \
  | grep -v -e '(used in module)' \
    -e "db.ts" \
    -e "policies/index.ts" \
    -e "services/index.ts" \
    -e "value-objects/index.ts" \
    -e "infra/index.ts" \
  || true

# Force exit code 0
