#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

TMP_GITIGNORE_FILEPATH="/tmp/.bgord-scripts-gitignore"

check_if_file_exists .gitignore

info "Merging .gitignore..."

sort --unique bgord-scripts/.gitignore .gitignore \
  | grep -v '#' \
  | tail +1 \
  > $TMP_GITIGNORE_FILEPATH \
  && mv $TMP_GITIGNORE_FILEPATH .gitignore

success ".gitignore merged correctly!"
