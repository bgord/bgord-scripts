#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

ensure_drizzle_set_up

export NODE_ENV="test"

step_start "DB seed test"
bun scripts/db-seed.ts
step_end "DB seed test"
