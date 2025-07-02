#!/usr/bin/env bash

info "Generating Drizzle schema..."

bunx drizzle-kit generate --config bgord-scripts/templates/drizzle.config.ts

success "Drizzle schema generated!"
