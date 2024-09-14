#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Setting up Prisma for SQLite..."
check_if_directory_does_not_exist prisma

install_dev_package prisma@5.19.1
install_dev_package @prisma/client@5.19.1

mkdir prisma
cp bgord-scripts/templates/schema-sqlite.prisma prisma/schema.prisma
cp bgord-scripts/templates/db.ts db.ts

info "Edit your data model in prisma/schema.prisma before continuing"

press_enter_to_continue

npx prisma generate
npx prisma migrate dev

success "Prisma for SQLite set up!"
