#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Installing commitlint dependencies..."

install_dev_package @commitlint/cli@19.5.0
install_dev_package @commitlint/config-conventional@19.5.0

info "Run './bgord-scripts/setup-husky.sh' to add the commit-msg git hook"
info "WARNING: you may want to double-check if other hooks were not rewritten!"
