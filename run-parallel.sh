#!/usr/bin/env bash
set -euo pipefail

JOB_NAME="$1"
shift

LOG_FILE="$(mktemp)"
EXIT_FILE="$(mktemp)"

(
  "$@" >"$LOG_FILE" 2>&1
  echo $? >"$EXIT_FILE"
) &

echo "$JOB_NAME:$LOG_FILE:$EXIT_FILE"
