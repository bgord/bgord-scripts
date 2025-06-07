#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Detecting vulnerable dependencies..."

bun audit

success "No vulnerable dependencies detected"
