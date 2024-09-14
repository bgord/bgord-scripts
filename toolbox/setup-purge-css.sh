#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Installing Purge CSS..."
npm install -D @fullhuman/postcss-purgecss@6.0.0
npm install -D postcss@8.4.45,
npm install -D postcss-cli@11.0.0

success "Purge CSS dependencies installed successfully!"
