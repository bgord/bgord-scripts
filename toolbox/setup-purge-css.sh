#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Installing Purge CSS..."
npm install -D @fullhuman/postcss-purgecss postcss{,-cli}

success "Purge CSS dependencies installed successfully!"
