#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Detecting unused code..."

npx ts-prune \
  | grep -v '(used in module)' \
  | grep -v 'db.ts' \
  | grep -v 'policies/index.ts' \
  | grep -v 'services/index.ts' \
  | grep -v 'value-objects/index.ts'
