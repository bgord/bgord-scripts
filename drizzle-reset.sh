#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Database delete"
rm -rf sqlite.db
step_end "Database delete"

./bgord-scripts/drizzle-generate.sh
./bgord-scripts/drizzle-migrate.sh
