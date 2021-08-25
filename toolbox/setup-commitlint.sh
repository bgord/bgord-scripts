#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Installing commitlint dependencies..."

yarn add -D @commitlint/{cli,config-conventional}

success "Commitlint set up!"
