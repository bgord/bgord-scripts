#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Generating Drizzle schema..."

bunx drizzle-kit generate --config bgord-scripts/templates/drizzle.config.ts

success "Drizzle schema generated!"
