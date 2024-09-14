#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Opening Prisma Studio..."

npx prisma studio --port 9090
