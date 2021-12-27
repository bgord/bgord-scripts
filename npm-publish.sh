#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

SKIP_VERSION_BUMP=$1

if test ! -z $SKIP_VERSION_BUMP
then
  if test $SKIP_VERSION_BUMP != "--skip-version-bump"
  then
    error "First argument - SKIP_VERSION_BUMP - has to --skip-version-bump or empty."
    info "Usage ./bgord-scripts/npm-publish.sh [--skip-version-bump]"
    exit 1
  fi
fi

CURRENT_BRANCH=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)

if test $CURRENT_BRANCH != "master"
then
  error "You have to have the master branch checked out"
  exit 1
fi
success "You are on the master branch"

if test $(git rev-parse master) != $(git rev-parse origin/master)
then
    error "There are some differences between master and origin/master"
    info "Please, sync them"
    exit 1
fi
success "All changes are pushed to the remote master branch"

if test $SKIP_VERSION_BUMP == '--skip-version-bump'
then
  info "Skipping version bump"
else
  ./bgord-scripts/version-bump.sh
  success "Bumped the package version"

  git push --follow-tags
  success "Pushed the version commit and new tag to origin/master"
fi

if test ! $(npm whoami)
then
  error "You're not logged in to npm"
  info "Run [npm login], you can find the credentials on Keeper"
  exit 1
fi
success "You're logged in to npm"

npm publish --dry-run
success "Ran npm publish --dry-run"

info "About to run [npm publish] after you press Enter"
press_enter_to_continue

npm publish

success "The package has been published!"
