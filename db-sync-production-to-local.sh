#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Using project: $PROJECT_NAME"

step_start "Database sync production to local"
scp "production:/var/www/$PROJECT_NAME/sqlite.db" .
step_end "Database sync production to local"
