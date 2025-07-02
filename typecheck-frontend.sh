#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Typechecking..."

cd frontend/
bunx react-router typegen
cd ../
bunx tsc --project frontend/tsconfig.json --noEmit

success "Types are correct!"
