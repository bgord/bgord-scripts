#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

SCHEMA_FILE="schema.prisma"

# Check if the schema file exists
if [ -f "$SCHEMA_FILE" ]; then
  info "Validating Prisma schema file at $SCHEMA_FILE..."
  npx prisma validate
else
  info "Prisma schema file - $SCHEMA_FILE - not found. Validation skipped."
fi
