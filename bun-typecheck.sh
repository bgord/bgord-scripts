#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Typechecking..."

bunx tsc --project tsconfig.json --noEmit

success "Types are correct!"
