#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Typechecking frontend..."

FRONTEND_DIRECTORY="frontend/"

if test -d "$FRONTEND_DIRECTORY"
then
  cd $FRONTEND_DIRECTORY

  bunx react-router typegen

  bunx tsc --project tsconfig.json --noEmit

  success "Types are correct!"
else
  error "$FRONTEND_DIRECTORY directory doesn't exist!"
  exit 1
fi
