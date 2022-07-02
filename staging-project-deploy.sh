#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

OUT_DIR="build"

info "Environment: staging"
info "Project name: $PROJECT_NAME"

ensure_ssh_staging_alias
allow_to_skip_within_5s

validate_non_empty $OUT_DIR "OUT_DIR"

rsync -azP --delete build/ "staging:/var/www/$PROJECT_NAME"

success "Project deployed correctly!"
