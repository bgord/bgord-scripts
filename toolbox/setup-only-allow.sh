#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Settuping up only-allow npm..."

install_dev_package only-allow
npm pkg set scripts.preinstall="npx only-allow npm"

success "only-allow npm set up!"
