#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Purging CSS..."
npx postcss static/main.min.css --replace --config bgord-scripts/templates

success "CSS purged!"
