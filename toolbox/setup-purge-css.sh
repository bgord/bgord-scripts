#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Installing Purge CSS..."

install_dev_package @fullhuman/postcss-purgecss@6.0.0
install_dev_package postcss@8.4.45,
install_dev_package postcss-cli@11.0.0

success "Purge CSS dependencies installed successfully!"
