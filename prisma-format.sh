#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Formatting Prisma schema file..."

npx prisma format

info "Prisma schema file formatted!"
