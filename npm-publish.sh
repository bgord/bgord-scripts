#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

# ========================================

VERSION_CHANGE=$1
CURRENT_BRANCH=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)

# ========================================

step_start "Version change"
validate_non_empty "VERSION_CHANGE" $VERSION_CHANGE

if test "$VERSION_CHANGE" == "major" || test "$VERSION_CHANGE" == "minor" || test "$VERSION_CHANGE" == "patch"
then
  info "Version change: $VERSION_CHANGE"
else
  error "Unsupported version change: $VERSION_CHANGE"
  exit 1
fi
step_end "Version change"

step_start "NPM login status"
if test ! $(npm whoami)
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
if test $(git rev-parse master) != $(git rev-parse origin/master)
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
npm version $VERSION_CHANGE
step_end "Version bump: $VERSION_CHANGE"

step_start "Tags push"
git push --no-verify
git push --tags --no-verify
step_end "Tags push"

step_start "Publish dry run"
npm publish --dry-run
step_end "Publish dry run"

info "About to run [npm publish] after you press Enter"
press_enter_to_continue

step_start "Publish"
npm publish
step_end "Publish"
