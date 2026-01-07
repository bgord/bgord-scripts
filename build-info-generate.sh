#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

OUTPUT_PATH="infra/build-info.json"

TIMESTAMP="$(date +%s)000"
VERSION=$(jq -r '.version' package.json)
SHA=$1

step_start "Build info generate"

validate_non_empty "TIMESTAMP" $TIMESTAMP
validate_non_empty "VERSION" $VERSION
validate_non_empty "SHA" $SHA

echo "{ \"timestamp\": $TIMESTAMP, \"sha\": \"$SHA\", \"version\": \"$VERSION\" }" > $OUTPUT_PATH

step_end "Build info generate"
