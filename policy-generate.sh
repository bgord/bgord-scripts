#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Generating a policy..."

POLICY_NAME_PASCAL_CASE=$1
DIRECTORY=$2

validate_non_empty "POLICY_NAME_PASCAL_CASE" $POLICY_NAME_PASCAL_CASE
validate_non_empty "DIRECTORY" $DIRECTORY

POLICY_NAME_KEBAB_CASE=$(
  echo "$POLICY_NAME_PASCAL_CASE" \
    | sed -E 's/([a-z0-9])([A-Z])/\1-\2/g' \
    | tr '[:upper:]' '[:lower:]'
)  

TEMPLATE_PATH="bgord-scripts/templates/policy-template.txt"

OUTPUT_PATH="$DIRECTORY/${POLICY_NAME_KEBAB_CASE}.ts"

sed "s/{{POLICY_NAME_PASCAL_CASE}}/${POLICY_NAME_PASCAL_CASE}/g" \
  "$TEMPLATE_PATH" > "$OUTPUT_PATH"

success "Policy generated at $OUTPUT_PATH"
