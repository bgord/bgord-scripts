#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Installing standard version dependency..."
npm install -D standard-version
ln -s bgord-scripts/.versionrc.json .

success "Standard version setup correctly!"
