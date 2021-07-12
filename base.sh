#!/usr/bin/env bash

function setup_base_config {
  # -e (exit immediately if a command fails)
  # -o pipefail (quit even if a command in a pipelina fails)

  set -eo pipefail
}

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

function check_if_file_exists {
  if test -f "$1"
  then
    success "$1 file exists!"
  else
    error "$1 file doesn't exist!"
    exit 1
  fi
}

function check_if_directory_exists {
  if test -d "$1"
  then
    success "$1 directory exists!"
  else
    error "$1 directory doesn't exist!"
    exit 1
  fi
}

function check_if_directory_does_not_exist {
  if test -d "$1"
  then
    error "$1 directory already exists!"
    exit 1
  else
    success "$1 directory doesn't exist."
  fi
}

function validate_non_empty {
  VARIABLE_NAME=$1
  VARIABLE_VALUE=$2

  if test -z "$VARIABLE_VALUE"
  then
    error "Empty argument: $VARIABLE_NAME";
    exit 1
  else
    success "Correct argument: $VARIABLE_NAME";
  fi
}

function install_dev_package {
  yarn add -D $@
}
