#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

VERSION_CHANGE=$1
CURRENT_BRANCH=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)

validate_non_empty "VERSION_CHANGE" $VERSION_CHANGE

if test "$VERSION_CHANGE" == "major" || test "$VERSION_CHANGE" == "minor" || test "$VERSION_CHANGE" == "patch"
then
  success "Version change: $VERSION_CHANGE"
else
  error "Unsupported version change: $VERSION_CHANGE"
  exit 1
fi

if test $(git rev-parse master) != $(git rev-parse origin/master)
then
    error "There are some differences between master and origin/master"
    info "Please, sync them"
    exit 1
fi
success "All changes are pushed to the remote master branch"

if test ! $(npm whoami)
then
  error "You're not logged in to npm"
  info "Run [npm login], you can find the credentials on Keeper"
  exit 1
fi
success "You're logged in to npm"

info "Changing app $VERSION_CHANGE version..."
npm version $VERSION_CHANGE
success "Version changed to $VERSION_CHANGE!"

info "Pushing version change..."
git push --no-verify
git push --tags --no-verify
success "Version change pushed!"

npm publish --dry-run
success "Ran npm publish --dry-run"

info "About to run [npm publish] after you press Enter"
press_enter_to_continue

npm publish

success "The package has been published!"
