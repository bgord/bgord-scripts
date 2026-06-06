#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Commit message lint"

COMMIT_MESSAGE_FILE_PATH=$1
COMMIT_MESSAGE=$(cat "$COMMIT_MESSAGE_FILE_PATH")

if test "${#COMMIT_MESSAGE}" -lt 3; then
  error "Commit message must be at least 3 characters long"
  exit 1
fi

if ! echo "$COMMIT_MESSAGE" | grep -q '^[[:upper:]]'; then
  error "Commit message must start with an uppercase letter"
  exit 1
fi

step_end "Commit message lint"
