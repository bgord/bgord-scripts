#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

OUTPUT_PATH="output/infra/build-info.json"

SHA=$1
validate_non_empty "SHA" "$SHA"

step_start "Build info generate"

TIMESTAMP="$(date +%s)000"
VERSION="v$(jq -re '.version' package.json)"
SIZE_SERVER=$(jq -e '.outputs["./index.js"].bytes' meta.json)
SIZE_WEB_JS=0
SIZE_WEB_CSS=0

if [ -d output/public ]; then
  SIZE_WEB_JS=$(find output/public -maxdepth 1 -name '*.js.br' -exec cat {} + | wc -c | tr -d ' ')
  SIZE_WEB_CSS=$(find output/public -maxdepth 1 -name '*.css.br' -exec cat {} + | wc -c | tr -d ' ')
fi

jq -n \
  --argjson timestamp "$TIMESTAMP" --arg sha "$SHA" --arg version "$VERSION" \
  --argjson server "$SIZE_SERVER" --argjson js "$SIZE_WEB_JS" --argjson css "$SIZE_WEB_CSS" \
  '{ timestamp: $timestamp, sha: $sha, version: $version, sizes: { server: $server, web: { js: $js, css: $css } } }' \
  > "$OUTPUT_PATH"

cat "$OUTPUT_PATH"

step_end "Build info generate"
