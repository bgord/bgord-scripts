#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Typecheck frontend"

FRONTEND_DIRECTORY="frontend/"

if test -d "$FRONTEND_DIRECTORY"
then
  cd $FRONTEND_DIRECTORY
  bunx react-router typegen
  bunx tsc --project tsconfig.json --noEmit
  step_end "Typecheck frontend"
else
  info "$FRONTEND_DIRECTORY directory doesn't exist!"
  step_end "Typecheck frontend"
  exit 0
fi
