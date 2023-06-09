#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

ROUTES_DIRECTORY="routes"
ROUTES_INDEX_FILENAME="$ROUTES_DIRECTORY/index.ts"

ROUTE_TEMPLATE_FILENAME="./bgord-scripts/templates/route-template"

info "Setting up a route"

read -p "Name of the route: (pascal cased): " ROUTE_NAME_PASCAL_CASE

validate_pascal_case "$ROUTE_NAME_PASCAL_CASE"

ROUTE_NAME_KEBAB_CASE=$(pascal_case_to_kebab_case "$ROUTE_NAME_PASCAL_CASE")

ROUTE_FILENAME="$ROUTES_DIRECTORY/$ROUTE_NAME_KEBAB_CASE.ts"

info "Creating route"
cp $ROUTE_TEMPLATE_FILENAME $ROUTE_FILENAME

sed -i '' -e "s/<name>/$ROUTE_NAME_PASCAL_CASE/g" $ROUTE_FILENAME

echo "export * from \"./$ROUTE_NAME_KEBAB_CASE\";" >> $ROUTES_INDEX_FILENAME

success "Route created to $ROUTE_FILENAME"
