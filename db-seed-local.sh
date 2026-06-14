#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

ensure_drizzle_set_up

export NODE_ENV="local"

step_start "DB seed local"
bun scripts/db-seed.ts
step_end "DB seed local"
