#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

INVARIANT_NAME_PASCAL_CASE=$1
DIRECTORY=$2

validate_non_empty "INVARIANT_NAME_PASCAL_CASE" $INVARIANT_NAME_PASCAL_CASE
validate_non_empty "DIRECTORY" $DIRECTORY

step_start "Invariant generate"

INVARIANT_NAME_KEBAB_CASE=$(
  echo "$INVARIANT_NAME_PASCAL_CASE" \
    | sed -E 's/([a-z0-9])([A-Z])/\1-\2/g' \
    | tr '[:upper:]' '[:lower:]'
)  

TEMPLATE_PATH="bgord-scripts/templates/invariant-template.txt"

OUTPUT_PATH="$DIRECTORY/${INVARIANT_NAME_KEBAB_CASE}.ts"

sed "s/{{INVARIANT_NAME_PASCAL_CASE}}/${INVARIANT_NAME_PASCAL_CASE}/g" \
  "$TEMPLATE_PATH" > "$OUTPUT_PATH"

step_end "Invariant generate"
