#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Installing commitlint dependencies..."

npm i -D @commitlint/{cli,config-conventional}

info "Run './bgord-scripts/setup-husky.sh' to add the commit-msg git hook"
info "WARNING: you may want to double-check if other hooks were not rewritten!"
