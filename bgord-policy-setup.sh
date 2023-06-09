#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

POLICIES_DIRECTORY="policies"
POLICIES_INDEX_FILENAME="$POLICIES_DIRECTORY/index.ts"

POLICY_TEMPLATE_FILENAME="./bgord-scripts/templates/policy-template"

info "Setting up a policy"

read -p "Name of the policy: (pascal cased): " POLICY_NAME_PASCAL_CASE

validate_pascal_case "$POLICY_NAME_PASCAL_CASE"

POLICY_NAME_KEBAB_CASE=$(pascal_case_to_kebab_case "$POLICY_NAME_PASCAL_CASE")

POLICY_FILENAME="$POLICIES_DIRECTORY/$POLICY_NAME_KEBAB_CASE.ts"

info "Creating template"
cp $POLICY_TEMPLATE_FILENAME $POLICY_FILENAME

sed -i '' -e "s/<name>/$POLICY_NAME_PASCAL_CASE/g" $POLICY_FILENAME

echo "export * from \"./$POLICY_NAME_KEBAB_CASE\";" >> $POLICIES_INDEX_FILENAME

success "Template created to $POLICY_FILENAME"
