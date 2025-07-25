#!/usr/bin/env bash

function setup_base_config {
  # -e (exit immediately if a command fails)
  # -o pipefail (quit even if a command in a pipeline fails)

  set -eo pipefail
}

RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
NC="\033[0m"

PROJECT_NAME=$(basename $(git rev-parse --show-toplevel 2>/dev/null) 2>/dev/null || echo "not-in-git")

CURRENT_TIME=$(date +%F-%H-%M-%S)
CURRENT_TIMESTAMP=$(date +%s)

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
  bun i -D $@
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

function allow_to_skip_within_5s {
  info "You can skip within 5s"

  info "5..."
  sleep 1

  info "4..."
  sleep 1

  info "3..."
  sleep 1

  info "2..."
  sleep 1

  info "1..."
  sleep 1

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

function press_enter_to_continue {
  read -s -p "Press enter to continue..."
  echo -e ""
}

function confirm_dangerous_action {
  WORD=$(grep -E '^[a-z]{4,5}$' /usr/share/dict/words | shuf -n1)

  read -rp "Type the word '$WORD' if you really want to perform this action: " TYPED

  if test "$WORD" != "$TYPED"
  then
    error "You typed "$WORD" wrong, aborting."
    exit 1
  fi
}

function ensure_ssh_staging_alias {
  (ssh -q staging exit)

  if test $? != '0'
  then
    error "The [staging] ssh alias is not present or doesn't work."
    exit 1
  fi
}

function ensure_ssh_production_alias {
  (ssh -q production exit)

  if test $? != '0'
  then
    error "The [production] ssh alias is not present or doesn't work."
    exit 1
  fi
}

function validate_environment_file {
  if bun run --env-file=".env.$NODE_ENV" infra/env.ts
  then
    success "Correct environment file!"
  else
    error "Invalid environment file, see the output below, quitting."
    exit 1
  fi
}

function validate_pascal_case {
  local VALUE="$1"

  if expr "$VALUE" : '^[A-Z][a-z]\{1,\}\([A-Z][a-z]\{1,\}\)*$' >/dev/null; then
    success "Correct PascalCase: $VALUE"
  else
    error "Invalid PascalCase: $VALUE"
    exit 1
  fi
}

function pascal_case_to_kebab_case {
  local PASCAL_CASE_VALUE="$1"
  local KEBAB_CASE_VALUE=$(echo "$PASCAL_CASE_VALUE" | sed 's/\([a-z0-9]\)\([A-Z]\)/\1-\2/g' | tr '[:upper:]' '[:lower:]')

  echo "$KEBAB_CASE_VALUE"
}

function set_node_timezone_to_utc {
  info "Setting node timezone to UTC"
  export TZ=UTC
}
