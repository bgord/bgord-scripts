#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Environment: production"

step_start "CSS copy"
cp frontend/node_modules/@bgord/design/dist/main.min.css frontend/public/
step_end "CSS copy"

step_start "Frontend build"
cd frontend/
NODE_ENV=production bunx --bun react-router build --mode production
step_end "Frontend build"
