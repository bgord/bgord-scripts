#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Dependencies audit"
if ! bun audit --audit-level high; then
  exit 1
fi
success "No security vulnerabilities found."
step_end "Dependencies audit"
