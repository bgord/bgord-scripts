#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

PROJECT_NAME=$(basename `git rev-parse --show-toplevel`)

info "Environment: staging"
info "Project name: $PROJECT_NAME"

ensure_ssh_staging_alias
allow_to_skip_within_5s

rsync -azP build/ "staging:/var/www/$PROJECT_NAME"
info "Synced source files"

ssh staging "sudo systemctl restart $PROJECT_NAME.service"
info "Restarted $PROJECT_NAME.service!"

success "Deployed!"
