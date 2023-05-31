#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Typechecking..."
npx tsc --project tsconfig.json --noEmit

./bgord-scripts/typecheck-prune.sh

success "Types are correct!"
