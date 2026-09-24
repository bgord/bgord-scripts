#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

OUTPUT_PATH="output/infra/build-info.json"
ENTRY="web/entry-client.tsx"

TIMESTAMP="$(date +%s)000"
VERSION="v$(jq -r '.version' package.json)"
SHA=$1
SIZE=$(jq '.outputs["./index.js"].bytes' meta.json)
ASSETS=$(jq -c --arg entry "$ENTRY" '
  (.outputs | to_entries) as $outputs
  | ($outputs[] | select(.value.entryPoint == $entry) | .key) as $entryPath
  | {
      entry: ("/public/" + ($entryPath | ltrimstr("./"))),
      preloads: ($outputs
        | map(select(.value.entryPoint != null and .key != $entryPath))
        | map({
            key: .value.entryPoint,
            value: ([.key] + [.value.imports[] | select(.kind == "import-statement") | .path]
              | map(select(. != $entryPath) | "/public/" + ltrimstr("./")))
          })
        | from_entries)
    }
' meta.web.json)

step_start "Build info generate"

validate_non_empty "TIMESTAMP" "$TIMESTAMP"
validate_non_empty "VERSION" "$VERSION"
validate_non_empty "SHA" "$SHA"
validate_non_empty "SIZE" "$SIZE"
validate_non_empty "ASSETS" "$ASSETS"

echo "{ \"timestamp\": $TIMESTAMP, \"sha\": \"$SHA\", \"version\": \"$VERSION\", \"size\": $SIZE, \"assets\": $ASSETS }" > "$OUTPUT_PATH"

cat "$OUTPUT_PATH"

step_end "Build info generate"
