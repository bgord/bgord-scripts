#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

SCHEMA_FILE="prisma/schema.prisma"

# Check if the schema file exists
if [ -f "$SCHEMA_FILE" ]; then
  info "Validating Prisma schema file at $SCHEMA_FILE..."

  npx prisma validate

  success "No Prisma schema validation errors!"
else
  info "Prisma schema file - $SCHEMA_FILE - not found. Validation skipped."
fi
