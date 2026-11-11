#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Check deprecated"
bun bgord-scripts/check-deprecated.ts
step_end "Check deprecated"
