#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Syncing database from production to local"

info "Using project: $PROJECT_NAME"

scp "production:/var/www/$PROJECT_NAME/sqlite.db" prisma

success "Successfully synced database for $PROJECT_NAME"
