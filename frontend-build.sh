#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Environment: production"
info "Building frontend..."

cp frontend/node_modules/@bgord/design/dist/main.min.css frontend/public/

cd frontend/
bunx --bun react-router build

success "Frontend built!"
