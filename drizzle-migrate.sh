#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

ensure_drizzle_set_up

step_start "Drizzle migrate"
bunx drizzle-kit migrate --config bgord-scripts/templates/drizzle.config.ts
step_end "Drizzle migrate"
