#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

check_if_file_exists .gitignore

info "Merging .gitignore..."
sort --unique bgord-scripts/.gitignore .gitignore > .gitignore

success ".gitignore merged correctly!"
