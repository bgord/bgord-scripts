#!/usr/bin/env bash

source bgord-scripts/base.sh

OUT_DIR="build"

info "Environment: production"
info "Project name: $PROJECT_NAME"

ensure_ssh_production_alias
allow_to_skip_within_5s

validate_non_empty $OUT_DIR "OUT_DIR"

rsync -azP --delete build/ "production:/var/www/$PROJECT_NAME"

success "Project deployed correctly!"
