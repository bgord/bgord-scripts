#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

PROJECT_NAME=$1
BASIC_AUTH_HEADER=$2

validate_non_empty "PROJECT_NAME" "$PROJECT_NAME"
validate_non_empty "BASIC_AUTH_HEADER" "$BASIC_AUTH_HEADER"

step_start "Healthcheck request"

RESPONSE="$(curl -sS -H "Authorization: Basic $BASIC_AUTH_HEADER" \
  -w $'\n%{http_code}\n' \
  "https://${PROJECT_NAME}.bgord.dev/api/healthcheck")"

STATUS="$(printf "%s" "$RESPONSE" | tail -n1)"
BODY="$(printf "%s" "$RESPONSE" | sed -e '$d')"

echo "Status: $STATUS"
echo "$BODY"

step_end "Healthcheck request"

if test "$STATUS" != "200" -a "$STATUS" != "429"; then
  exit 1
fi
