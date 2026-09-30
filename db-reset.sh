#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

ensure_drizzle_set_up

step_start "DB reset"
DATABASE_PATH="${DATABASE_PATH:-sqlite.db}"
rm -f "$DATABASE_PATH" "$DATABASE_PATH-wal" "$DATABASE_PATH-shm"
./bgord-scripts/db-generate.sh
./bgord-scripts/db-migrate.sh
step_end "DB reset"
