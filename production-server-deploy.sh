#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

PERFORM_SERVICE_RESTART="yes"

while getopts ":s" option; do
  case ${option} in
    s )
      PERFORM_SERVICE_RESTART="no"
      ;;
    \? ) echo "Usage: cmd [-s]"
      ;;
  esac
done

info "Environment: production"
info "Project name: $PROJECT_NAME"
info "Perform service restart: $PERFORM_SERVICE_RESTART"

ensure_ssh_production_alias
allow_to_skip_within_5s

rsync -azP build/ "production:/var/www/$PROJECT_NAME"
info "Synced source files"

if test $PERFORM_SERVICE_RESTART = "yes"
then
  ssh production "sudo systemctl restart $PROJECT_NAME.service"
  info "Restarted $PROJECT_NAME.service!"
else
  info "Skipping service restart due to option -s"
fi

success "Deployed!"

