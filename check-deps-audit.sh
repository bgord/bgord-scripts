#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Deps audit"
if ! bun audit --audit-level high; then
  exit 1
fi
step_end "Deps audit"
