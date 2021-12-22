#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Bumping version"
npx standard-version --no-verify
success "Version bumped!"
