#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

check_if_file_exists "package.json"

step_start "Deps ensure"
check_if_package_installed "@biomejs/biome"
check_if_package_installed "@stryker-mutator/core"
check_if_package_installed "@stryker-mutator/typescript-checker"
check_if_package_installed "@types/bun"
check_if_package_installed "cspell"
check_if_package_installed "fallow"
check_if_package_installed "lefthook"
check_if_package_installed "lockfile-lint"
check_if_package_installed "shellcheck"
check_if_package_installed "typescript"
check_if_package_installed "@typescript/native-preview"
step_end "Deps ensure"
