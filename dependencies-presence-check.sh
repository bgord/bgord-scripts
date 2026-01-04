#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Dependencies presence check"

check_if_file_exists "package.json"

check_if_package_installed "@biomejs/biome"
check_if_package_installed "@commitlint/cli"
check_if_package_installed "@commitlint/config-conventional"
check_if_package_installed "@stryker-mutator/core"
check_if_package_installed "@types/bun"
check_if_package_installed "cspell"
check_if_package_installed "knip"
check_if_package_installed "lefthook"
check_if_package_installed "lockfile-lint"
check_if_package_installed "only-allow"
check_if_package_installed "shellcheck"
check_if_package_installed "typescript"

step_end "Dependencies presence check"
