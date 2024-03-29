#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Settuping up only-allow npm..."

npm i -D only-allow
npm pkg set scripts.preinstall="npx only-allow npm"

success "only-allow npm set up!"
