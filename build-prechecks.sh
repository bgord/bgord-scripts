#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

./bgord-scripts/typecheck.sh
./bgord-scripts/typecheck-prune.sh
./bgord-scripts/test-run.sh
./bgord-scripts/dependencies-outdated.sh
./bgord-scripts/compare-configs.sh
./bgord-scripts/dependencies-pinpoint.sh
./bgord-scripts/dependencies-import-check.sh
./bgord-scripts/biome-check.sh
./bgord-scripts/shellcheck.sh
./bgord-scripts/e2e-run.sh
