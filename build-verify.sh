#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

./bgord-scripts/typecheck.sh
./bgord-scripts/dead-code.sh
./bgord-scripts/test.sh
./bgord-scripts/check-drift.sh
./bgord-scripts/deps-pin.sh
./bgord-scripts/check-boundaries.sh
./bgord-scripts/deps-ensure.sh
./bgord-scripts/deps-audit.sh
./bgord-scripts/lockfile-lint.sh
./bgord-scripts/shellcheck.sh
./bgord-scripts/check-code.sh
./bgord-scripts/gitleaks-scan.sh
./bgord-scripts/e2e-run.sh
