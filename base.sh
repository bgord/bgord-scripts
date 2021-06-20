#!/usr/bin/env bash

RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
NC="\033[0m"

function info {
  MESSAGE=$1
  echo -e "$BLUE   [info]$NC   $MESSAGE"
}

function success {
  MESSAGE=$1
  # shellcheck disable=SC1087
  echo -e "$GREEN[success]$NC   $MESSAGE"
}

function error {
  MESSAGE=$1
  echo -e "$RED  [error]$NC   $MESSAGE"
}

function goal {
  MESSAGE=$1
  info "[GOAL] $MESSAGE"
}
