#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

export NODE_ENV="test"

step_start "Drizzle seed test"
bun scripts/db-seed.ts
step_end "Drizzle seed test"
