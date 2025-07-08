#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Environment: production"
info "Serving frontend..."

cp frontend/node_modules/@bgord/design/dist/main.min.css frontend/public/
cp frontend/node_modules/@bgord/design/dist/normalize.min.css frontend/public/

./bgord-scripts/frontend-build.sh

cd frontend/
bunx react-router-serve ./build/server/index.js
