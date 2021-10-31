#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Installing Husky..."
npm i -D husky
npm set-script prepare "husky install"
npm run prepare
npx husky add .husky/pre-commit "./bgord-scripts/pre-commit.sh"
npx husky add .husky/pre-push "./bgord-scripts/pre-push.sh"
npx husky add .husky/commit-msg "./bgord-scripts/commit-msg.sh"

success "Husky set up!"
