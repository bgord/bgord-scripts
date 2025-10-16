#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Environment: production"

step_start "CSS copy"
cp frontend/node_modules/@bgord/design/dist/main.min.css frontend/public/
step_end "CSS copy"

./bgord-scripts/frontend-build.sh

step_start "Frontend serve test"
cd frontend/
bunx --bun react-router-serve ./build/server/index.js
step_end "Frontend serve test"
