#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Setting up production-server-build.sh..."

cp bgord-scripts/templates/production-server-build.sh scripts/

success "production-server-build.sh script setup!"
