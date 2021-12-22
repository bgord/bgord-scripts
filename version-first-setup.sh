#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Creating first version..."
npx standard-version --first-release --no-verify --types '[{"type":"feature","section":"Features"},{"type":"fix","section":"Bug Fixes"},{"type":"step","hidden":true},{"type":"docs","hidden":true},{"type":"refactor","hidden":true},{"type":"style","hidden":true},{"type":"test","hidden":true}]'

success "First version created!"
