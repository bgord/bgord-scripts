#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

FILE_LIST_PATH=$1
OUTPUT_PATH="output.md"

validate_non_empty $FILE_LIST_PATH "FILE_LIST_PATH"

step_start "Files pack"

while read -r target_path; do
  echo "$target_path"
  echo '```'
  cat "$target_path"
  echo -e '```\n'
done < "$FILE_LIST_PATH" > "$OUTPUT_PATH"

step_end "Files pack"
