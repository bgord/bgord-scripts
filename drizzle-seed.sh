#!/usr/bin/env bash

info "Seeding Drizzle database..."

export NODE_ENV="local"

bun scripts/local-db-seed.ts

success "Drizzle database seeded!"
