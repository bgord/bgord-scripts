#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Verifying dependencies"

check_if_file_exists "package.json"

# Fail if any version in deps/devDeps/peerDeps starts with '^'
if CARET_DEPS=$(jq -r '
  def e(section):
    .[section] // {}
    | to_entries[]
    | select(.value | type=="string" and startswith("^"))
    | "\(.key)=\(.value)\t[" + section + "]";
  e("dependencies"),
  e("devDependencies"),
  e("peerDependencies")
' package.json); [[ -n "${CARET_DEPS}" ]]; then
  error "Found caret (^) versions:"
  echo "${CARET_DEPS}" | sed 's/^/  - /'
  exit 1
fi

success "Dependencies verified"
