#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Installing new @bgord/frontend package version..."

npm install @bgord/frontend

info "Committing package.json changes"

git add package.json package-lock.json
git commit -m "step: bump bgord/frontend" --no-verify

success "New @bgord/frontend package version installed!"
