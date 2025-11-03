#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

if ! test -d "infra/drizzle"
then
  info "Database not set up"
  exit 0
fi

step_start "Database delete"
rm -rf sqlite.db
step_end "Database delete"

./bgord-scripts/drizzle-generate.sh
./bgord-scripts/drizzle-migrate.sh
