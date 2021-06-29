#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

info "Installing Husky..."
npm install -D husky
npm set-script prepare "husky install"
npm run prepare
npx husky add .husky/pre-commit "./bgord-scripts/pre-commit.sh"
npx husky add .husky/pre-push "./bgord-scripts/pre-push.sh"

success "Husky set up!"
