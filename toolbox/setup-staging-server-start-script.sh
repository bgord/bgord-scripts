#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

PROJECT_NAME=$1
validate_non_empty "PROJECT_NAME" $PROJECT_NAME

cp bgord-scripts/templates/staging-server-start.sh scripts/
chmod +x scripts/staging-server-start.sh
sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" scripts/staging-server-start.sh

success "staging-server-scripts.sh script setup!"
