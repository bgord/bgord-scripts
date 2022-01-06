#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Deleting SQL database..."
rm -rf prisma/sqlite.db

info "Migrating..."
npx prisma migrate dev
