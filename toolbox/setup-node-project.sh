#!/usr/bin/env bash

BGORD_SCRIPTS_BASE_PATH="/home/bartosz/Desktop/projects/bgord-scripts"

# Preload base bash configuration and functions
source "$BGORD_SCRIPTS_BASE_PATH/base.sh"
setup_base_config

DIRECTORY=$1
validate_non_empty "DIRECTORY" $DIRECTORY
check_if_directory_does_not_exist $DIRECTORY

mkdir $DIRECTORY
cd $DIRECTORY
git init
npm init --yes
git submodule add https://github.com/bgord/bgord-scripts
touch .gitignore
bash "$BGORD_SCRIPTS_BASE_PATH/toolbox/merge-gitignore.sh"
bash "$BGORD_SCRIPTS_BASE_PATH/toolbox/setup-eslint.sh"
bash "$BGORD_SCRIPTS_BASE_PATH/toolbox/setup-husky.sh"
npm install typescript@4.1.5 zod@3.1.0 @bgord/{node,design} express
npm install --save-dev \
  ts-node-dev \
  @types/{cors,express,express-handlebars,express-session,lodash,nodemailer} \
  @commitlint/{cli,config-conventional} \
  gzip
touch .env.example
touch .env.local
echo 'PORT=3000' > .env.example
echo 'PORT=3000' > .env.local
cp "$BGORD_SCRIPTS_BASE_PATH/templates/index.ts" .
cp "$BGORD_SCRIPTS_BASE_PATH/templates/env.ts" .
mkdir routes policies value-objects scripts static aggregates repositories
cp "$BGORD_SCRIPTS_BASE_PATH/templates/local-server-start.sh" scripts/
cp "$BGORD_SCRIPTS_BASE_PATH/templates/tsconfig.json" .
git add .
git commit -m "feature: setup project" --no-verify

new_line

info "$DIRECTORY project has been set up!"
info "Type: cd $DIRECTORY"
