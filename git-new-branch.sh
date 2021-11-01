#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

# USAGE:
# ./bgord-scripts/git-new.branch.sh [branch-type: f, feature, b, bugfix] [branch-name]
# ./bgord-scripts/git-new.branch.sh f add-cypress

BRANCH_TYPE=$1
BRANCH_NAME=$2

info "Creating a git branch..."

load_contributor_file

validate_non_empty "NICKNAME" "$NICKNAME"
validate_non_empty "BRANCH_TYPE" "$BRANCH_TYPE"
validate_non_empty "BRANCH_NAME" "$BRANCH_NAME"

if test "$BRANCH_TYPE" == "f" || test "$BRANCH_TYPE" == "feature";
then
  BRANCH="feature/$NICKNAME/$BRANCH_NAME"
  info "Creating branch: $BRANCH"
  git checkout -b "$BRANCH"
elif test "$BRANCH_TYPE" == "b" || test "$BRANCH_TYPE" == "bugfix";
then
  BRANCH="bugfix/$NICKNAME/$BRANCH_NAME"
  info "Creating branch: $BRANCH"
  git checkout -b "$BRANCH"
else
  error "Unexpected value for BRANCH_TYPE, should be one of: f, feature, b, bugfix."
fi
