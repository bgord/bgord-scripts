#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

PROJECT_NAME=$1
validate_non_empty "PROJECT_NAME" $PROJECT_NAME

cp bgord-scripts/templates/production-server-start.sh scripts/
chmod +x scripts/production-server-start.sh
sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" scripts/production-server-start.sh

success "production-server-scripts.sh script setup!"
