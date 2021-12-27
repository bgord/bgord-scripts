#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

cp bgord-scripts/templates/staging-server-build.sh scripts/

success "staging-server-build.sh script setup!"
