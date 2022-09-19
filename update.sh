#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Performing an auto-update..."
cd bgord-scripts/
git pull origin master

cd ../
pwd
git add bgord-scripts
git commit -m "step: bump bgord/scripts" --no-verify

success "Updated!"
