#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Setting up Prisma for SQLite..."
check_if_directory_does_not_exist prisma

install_dev_package prisma
mkdir prisma
cp bgord-scripts/templates/schema-sqlite.prisma prisma/schema.prisma

success "Prisma for SQLite set up!"
