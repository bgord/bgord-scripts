#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Resetting Drizzle database..."

info "Deleting SQL database..."

rm -rf sqlite.db

info "Generating..."

./bgord-scripts/drizzle-generate.sh

info "Migrating..."

./bgord-scripts/drizzle-migrate.sh

success "Drizzle database resetted correctly!"
