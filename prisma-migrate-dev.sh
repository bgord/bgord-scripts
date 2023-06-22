#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Migrating Prisma schema..."
npx prisma migrate dev
