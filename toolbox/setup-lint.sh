#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Installing linter dependencies..."
npm install -D @typescript-eslint/{parser,eslint-plugin} eslint eslint-config-{bgord,prettier} eslint-plugin-{jsx-a11y,react,react-hooks,sonarjs}
npm install -D oxlint

success "Linter dependencies installed successfully!"
