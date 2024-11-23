#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Installing Lefthook..."

install_dev_package lefthook@1.8.2

cp bgord-scripts/templates/lefthook-target.yml lefthook.yml
bunx lefthook install

success "Lefthook set up!"
