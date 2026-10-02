#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

OUTPUT_PATH="output/infra/build-info.json"

TIMESTAMP="$(date +%s)000"
VERSION="v$(jq -r '.version' package.json)"
SHA=$1
SIZE_SERVER=$(jq '.outputs["./index.js"].bytes' meta.json)
SIZE_WEB_JS=$(find output/public -maxdepth 1 -name '*.js.br' -exec cat {} + | wc -c | tr -d ' ')
SIZE_WEB_CSS=$(find output/public -maxdepth 1 -name '*.css.br' -exec cat {} + | wc -c | tr -d ' ')

step_start "Build info generate"

validate_non_empty "TIMESTAMP" "$TIMESTAMP"
validate_non_empty "VERSION" "$VERSION"
validate_non_empty "SHA" "$SHA"
validate_non_empty "SIZE_SERVER" "$SIZE_SERVER"
validate_non_empty "SIZE_WEB_JS" "$SIZE_WEB_JS"
validate_non_empty "SIZE_WEB_CSS" "$SIZE_WEB_CSS"

echo "{ \"timestamp\": $TIMESTAMP, \"sha\": \"$SHA\", \"version\": \"$VERSION\", \"sizes\": { \"server\": $SIZE_SERVER, \"web\": { \"js\": $SIZE_WEB_JS, \"css\": $SIZE_WEB_CSS } } }" > "$OUTPUT_PATH"

cat "$OUTPUT_PATH"

step_end "Build info generate"
