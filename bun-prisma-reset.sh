#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Resetting Prisma database..."

info "Deleting SQL database..."

rm -rf prisma/sqlite.db

info "Migrating..."

bunx prisma migrate dev

success "Prisma database resetted correctly!"
