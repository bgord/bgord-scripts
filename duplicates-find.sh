#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Finding duplicates"

npx jscpd modules/ app/ infra/

success "No duplicates!"
