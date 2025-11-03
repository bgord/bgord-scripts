#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

ensure_drizzle_set_up

step_start "Drizzle generate"
bunx drizzle-kit generate --config bgord-scripts/templates/drizzle.config.ts
step_end "Drizzle generate"
