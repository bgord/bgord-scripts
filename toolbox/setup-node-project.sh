#!/usr/bin/env bash

BGORD_SCRIPTS_BASE_PATH="/home/bartosz/Desktop/projects/dotfiles/bgord-scripts"

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
"$BGORD_SCRIPTS_BASE_PATH/toolbox/merge-ignore.sh"
"$BGORD_SCRIPTS_BASE_PATH/toolbox/setup-eslint.sh"
"$BGORD_SCRIPTS_BASE_PATH/toolbox/setup-husky.sh"
npm install typescript@4.1.5 zod@3.1.0 @bgord/{node,design} express
npm install --save-dev \
  ts-node-dev \
  @types/{cors,express,express-handlebars,express-session,lodash,nodemailer} \
  gzip
touch .env
touch .env.local
echo 'PORT=3000' > .env
echo 'PORT=3000' > .env.local
