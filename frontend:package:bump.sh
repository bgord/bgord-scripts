#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

info "Installing new @bgord/frontend package version"

npm install @bgord/frontend

info "Commiting package.json changes"

git add package.json package-lock.json
git commit -m "step: bump bgord/frontend"
