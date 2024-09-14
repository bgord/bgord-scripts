#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Deleting SQL database..."
rm -rf prisma/sqlite.db

info "Migrating..."
npx prisma migrate dev
