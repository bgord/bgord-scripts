#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Environment: production"
info "Building frontend..."

cp node_modules/@bgord/design/dist/main.min.css frontend/public/

cd frontend/
NODE_ENV=production bunx --bun react-router build --mode production

success "Frontend built!"
