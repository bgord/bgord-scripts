#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Installing TypeScript dependency..."

install_dev_package typescript@5.6.2
cp ./bgord-scripts/templates/tsconfig.json .

success "TypeScript set up successfully!"
