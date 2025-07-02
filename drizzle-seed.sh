#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Seeding Drizzle database..."

export NODE_ENV="local"

bun scripts/local-db-seed.ts

success "Drizzle database seeded!"
