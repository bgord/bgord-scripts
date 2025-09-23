#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Typecheck frontend watch..."

FRONTEND_DIRECTORY="frontend/"

if test -d "$FRONTEND_DIRECTORY"
then
  cd $FRONTEND_DIRECTORY

  bunx react-router typegen

  bunx tsc --watch --preserveWatchOutput --project tsconfig.json --noEmit
else
  info "$FRONTEND_DIRECTORY directory doesn't exist!"
  exit 0
fi
