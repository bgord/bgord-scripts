#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null # nvm is an optional, machine-local install
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh" || true

# ========================================

VERSION_CHANGE=$1

# ========================================

step_start "Version change"
validate_non_empty "VERSION_CHANGE" "$VERSION_CHANGE"

if test "$VERSION_CHANGE" == "major" || test "$VERSION_CHANGE" == "minor" || test "$VERSION_CHANGE" == "patch"
then
  info "Version change: $VERSION_CHANGE"
else
  error "Unsupported version change: $VERSION_CHANGE"
  exit 1
fi
step_end "Version change"

step_start "NPM login status"
if ! npm whoami >/dev/null 2>&1
then
  info "You are not logged in to npm"
  npm login
fi
step_end "NPM login status"

step_start "Mutation tests"
info "Have you run the mutation tests?"
press_enter_to_continue
step_end "Mutation tests"

step_start "Audit"
info "Have you run the dependencies audit?"
press_enter_to_continue
step_end "Audit"

step_start "Sync status"
LOCAL_SHA=$(git rev-parse master)
REMOTE_SHA=$(git rev-parse origin/master)

if [[ "$LOCAL_SHA" != "$REMOTE_SHA" ]]
then
    error "There are some differences between master and origin/master"
    info "Please, sync them"
    exit 1
fi
step_end "Sync status"

step_start "Build package"
bun run build
step_end "Build package"

step_start "Version bump: $VERSION_CHANGE"
npm version "$VERSION_CHANGE"
step_end "Version bump: $VERSION_CHANGE"

step_start "Tags push"
git push --no-verify
git push --tags --no-verify
step_end "Tags push"

step_start "Stage Package" 
npm stage publish  
step_end "Stage Package"

info "Package version ${VERSION_CHANGE}"
