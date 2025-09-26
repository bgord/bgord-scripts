#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Dependencies pinpoint"

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
  error "Found versions:"
  echo "${CARET_DEPS}" | sed 's/^/  - /'
  exit 1
fi

step_end "Dependencies pinpoint"
