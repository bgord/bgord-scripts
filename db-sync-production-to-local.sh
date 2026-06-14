#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Project: $PROJECT_NAME"

step_start "DB sync production to local"
scp "production:/var/www/$PROJECT_NAME/sqlite.db" .
step_end "DBDatabase sync production to local"
