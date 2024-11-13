#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Installing commitlint dependencies..."

install_dev_package @commitlint/cli@19.5.0
install_dev_package @commitlint/config-conventional@19.5.0

success "Commitlint setup finished!"
