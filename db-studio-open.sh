#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

ensure_drizzle_set_up

step_start "DB studio open"
bunx drizzle-kit studio --config bgord-scripts/templates/drizzle.config.ts
step_end "DB studio open"
