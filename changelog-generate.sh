#!/bin/bash

output_file="infra/CHANGELOG.md"

echo "# Changelog" > "$output_file"

lines=$(git log --pretty=format:"- %ad %h **%s**" --date=format:'%Y-%m-%d %H:%M')
tags=$(git tag -l --sort=-creatordate)

while read -r tag; do
    tag_date=$(git log -1 --pretty=format:"%ad" --date=format:'%Y-%m-%d %H:%M' $tag)
    tag_hash=$(git rev-parse --short $tag)
    lines="$lines\n## $tag_date $tag"
done <<< "$tags"

echo -e "$lines" | sort -r -k 2 >> "$output_file"
