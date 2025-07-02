#!/usr/bin/env bash

info "Migrating Drizzle database..."

bunx drizzle-kit migrate --config bgord-scripts/templates/drizzle.config.ts

success "Drizzle database migrating!"
