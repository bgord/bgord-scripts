#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Lockfile Lint"

trap "rm -f yarn.lock" EXIT

bun install --yarn --lockfile-only > /dev/null 2>&1

bunx lockfile-lint \
  --path yarn.lock \
  --type yarn \
  --validate-https \
  --allowed-hosts npm \
  --empty-hostname false \
  --validate-package-names \
  --validate-integrity

step_end "Lockfile Lint"
