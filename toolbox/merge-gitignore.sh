#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

check_if_file_exists .gitignore

info "Merging .gitignore..."
sort --unique bgord-scripts/.gitignore .gitignore

success ".gitignore merged correctly!"
