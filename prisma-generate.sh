#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Generating Prisma client"

npx prisma generate

success "Prisma client generated!"
