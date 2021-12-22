#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Creating first version..."
npx standard-version --first-release --no-verify
success "First version created!"
