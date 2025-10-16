#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "CSS copy"
cp frontend/node_modules/@bgord/design/dist/main.min.css frontend/public/
step_end "CSS copy"

info "Frontend watch..."

cd frontend/
bunx --bun react-router dev
