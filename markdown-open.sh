#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

MARKDOWN_PATH=$1

step_start "Markdown open"

validate_non_empty "MARKDOWN_PATH" "$MARKDOWN_PATH"
check_if_file_exists "$MARKDOWN_PATH"

HTML_PATH="$(mktemp -t markdown-open).html"
bunx marked "$MARKDOWN_PATH" -o "$HTML_PATH"
open "$HTML_PATH"

step_end "Markdown open"
