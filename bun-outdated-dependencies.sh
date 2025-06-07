#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Detecting outdated dependencies..."

outdated=$(bun outdated)

has_outdated_dependencies=false

if grep -q 'Package.*Current.*Update.*Latest' <<< "$outdated"; then
  has_outdated_dependencies=true
fi

echo "$outdated"

if [ "$has_outdated_dependencies" = true ]; then
  error "There are outdated dependencies."
  exit 1
else
  success "All dependencies are up-to-date."
  exit 0
fi
