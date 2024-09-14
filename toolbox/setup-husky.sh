#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Installing Husky..."

install_dev_package husky@9.1.5
npx husky init
echo "./bgord-scripts/pre-commit.sh" > .husky/pre-commit
echo "./bgord-scripts/pre-push.sh" > .husky/pre-push
echo "./bgord-scripts/commit-msg.sh" > .husky/commit-msg

success "Husky set up!"
