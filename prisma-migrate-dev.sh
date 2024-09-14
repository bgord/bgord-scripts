#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Migrating Prisma schema..."
npx prisma migrate dev
