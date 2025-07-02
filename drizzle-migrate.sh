#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Migrating Drizzle database..."

bunx drizzle-kit migrate --config bgord-scripts/templates/drizzle.config.ts

success "Drizzle database migrating!"
