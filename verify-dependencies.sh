#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Verifying dependencies"

function check_dependencies() {
  local package_json_path="package.json"
  local dep_type=$1

  if ! jq -e ".$dep_type" "$package_json_path" >/dev/null; then
    return
  fi

  while read -r name version; do
    if test "$version" == *"^"* || test "$version" == *"~"*; then
      error "$name@$version in $package_json_path is not pinned"
      exit 1
    fi

    if test "$version" == *"file:"*; then
      error "$name@$version in $package_json_path is not pinned"
      exit 1
    fi
  done < <(jq -r ".$dep_type | to_entries | .[] | .key + \" \" + .value" "$package_json_path")
}

check_dependencies "dependencies"
check_dependencies "devDependencies"
check_dependencies "peerDependencies"

success "Dependencies verified"
