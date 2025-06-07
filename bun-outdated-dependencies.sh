#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Detecting outdated dependencies..."

outdated=$(bun outdated)

if echo "$outdated" | grep -qE '^\s*\S+\s+\S+\s+\S+\s+\S+'; then
  echo "$outdated"
  error "There are outdated dependencies."
  exit 1
else
  echo "$outdated"
  success "All dependencies are up-to-date."
  exit 0
fi
