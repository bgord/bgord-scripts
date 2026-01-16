#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

PARALLEL_JOBS=()
FAILED=false

run_job() {
  PARALLEL_JOBS+=("$(./bgord-scripts/run-parallel.sh "$@")")
}

wait_jobs() {
  for job in "${PARALLEL_JOBS[@]}"; do
    IFS=: read -r NAME LOG EXIT <<<"$job"

    wait || true
    CODE=$(cat "$EXIT")

    echo
    info "=== $NAME ==="
    cat "$LOG"

    rm -f "$LOG" "$EXIT"

    if [ "$CODE" -ne 0 ]; then
      error "$NAME failed"
      FAILED=true
    fi
  done

  PARALLEL_JOBS=()

  if [ "$FAILED" = true ]; then
    exit 1
  fi
}

run_job "typecheck" ./bgord-scripts/typecheck.sh
run_job "typecheck-prune" ./bgord-scripts/typecheck-prune.sh
run_job "deps-outdated" ./bgord-scripts/dependencies-outdated.sh
run_job "deps-pinpoint" ./bgord-scripts/dependencies-pinpoint.sh
run_job "deps-imports" ./bgord-scripts/dependencies-import-check.sh
run_job "deps-audit" ./bgord-scripts/dependencies-audit.sh
run_job "lockfile" ./bgord-scripts/lockfile-lint.sh
run_job "gitleaks" ./bgord-scripts/gitleaks-scan.sh
run_job "shellcheck" ./bgord-scripts/shellcheck.sh
run_job "biome" ./bgord-scripts/biome-check.sh
run_job "configs" ./bgord-scripts/compare-configs.sh

wait_jobs

./bgord-scripts/test-run.sh
./bgord-scripts/e2e-run.sh
