#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

VERSION_BUMP_KIND=$1
validate_non_empty "VERSION_BUMP_KIND" $VERSION_BUMP_KIND

if test $VERSION_BUMP_KIND != "--major" && test $VERSION_BUMP_KIND != "--minor" && test $VERSION_BUMP_KIND != "--patch"
then
  error "First argument - VERSION_BUMP_KIND - has to be one of: --major, --minor, or --patch."
  info "Usage ./bgord-scripts/npm-publish.sh [--major|--major|--patch]"
  exit 1
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

yarn version $VERSION_BUMP_KIND
success "Bumped the package version"

git push --follow-tags
success "Pushed the version commit and new tag to origin/master"

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
