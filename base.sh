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
  local MESSAGE=$1
  echo -e "$BLUE   [info]$NC   $MESSAGE"
}

function success {
  local MESSAGE=$1
  # shellcheck disable=SC1087
  echo -e "$GREEN[success]$NC   $MESSAGE"
}

function error {
  local MESSAGE=$1
  echo -e "$RED  [error]$NC   $MESSAGE"
}

function goal {
  local MESSAGE=$1
  info "[GOAL] $MESSAGE"
}

function new_line {
  echo -e ""
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
  local VARIABLE_NAME=$1
  local VARIABLE_VALUE=$2

  if test -z "$VARIABLE_VALUE"
  then
    error "Empty argument: $VARIABLE_NAME";
    exit 1
  else
    success "Correct argument: $VARIABLE_NAME";
  fi
}

function install_dev_package {
  npm i -D $@
}

function check_if_binary_exists {
  if test -x "$(command -v $1)"
  then
    success "$2 is installed!"
  else
    error "$2 is not installed!"
    exit 1
  fi
}

function load_contributor_file {
  info "Loading .contributor file..."

  check_if_file_exists ".contributor"

  set -a
  . .contributor
  set +a
}

function allow_to_skip_within_5s {
  info "You can skip within 5s"

  info "5..."
  sleep 1s

  info "4..."
  sleep 1s

  info "3..."
  sleep 1s

  info "2..."
  sleep 1s

  info "1..."
  sleep 1s

  success "Proceeding..."
}

function check_if_linux_or_macos {
  local KERNEL_NAME=$(uname -s)

  if test $KERNEL_NAME == "Linux" || test $KERNEL_NAME == "Darwin"
  then
    success "Your host machine is either Linux or MacOS!"
  else
    error "Unsupported operating system, Linux or MacOS required."
    exit 1
  fi
}

function ensure_git_root_directory {
  local NEAREST_GIT_REPOSITORY_ROOT_DIRECTORY=$(git rev-parse --show-toplevel)
  local CURRENT_DIRECTORY=$(pwd)

  if test $NEAREST_GIT_REPOSITORY_ROOT_DIRECTORY != $CURRENT_DIRECTORY
  then
    error "It seems you're trying to run the script outside the root git repository directory."
    exit 1
  fi
}

function ensure_vagrant_machine_is_running {
  local IS_MACHINE_RUNNING=$(vagrant status | tail +3 | head -n 1 | grep running | wc -l)

  if test $IS_MACHINE_RUNNING != '1'
  then
    error "The test_staging_server Vagrant machine is not running"
    info "Starting the machine..."
    vagrant up --no-provision
    success "The machine has been started!"
  fi
}

function press_enter_to_continue {
  read -s -p "Press enter to continue..."
  echo -e ""
}

function ensure_ssh_staging_alias {
  (ssh -q staging exit)

  if test $? != '0'
  then
    error "The [staging] ssh alias is not present or doesn't work."
    exit 1
  fi
}

function validate_environment_file {
  if npx ts-node env.ts
  then
    success "Correct environment file!"
  else
    error "Invalid environment file, see the output below, quitting."
    exit 1
  fi
}
