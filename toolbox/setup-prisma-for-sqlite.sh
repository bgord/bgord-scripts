#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Setting up Prisma for SQLite..."
check_if_directory_does_not_exist prisma

install_dev_package prisma
mkdir prisma
cp bgord-scripts/templates/schema-sqlite.prisma prisma/schema.prisma
cp bgord-scripts/templates/db.ts db.ts

info "1. Edit your data model in prisma/schema.prisma"
info "2. Run 'npx prisma generate' to generate Prisma client for your data model"
info "3. Run 'npx prisma migrate dev' to create your first migration"

success "Prisma for SQLite set up!"
