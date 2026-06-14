#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

ensure_drizzle_set_up

step_start "DB reset"
rm -rf sqlite.db
./bgord-scripts/db-generate.sh
./bgord-scripts/db-migrate.sh
step_end "DB reset"
