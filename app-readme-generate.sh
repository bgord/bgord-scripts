#!/bin/bash

source bgord-scripts/base.sh
setup_base_config

OUTPUT_FILE="readme.md"

PROJECT_NAME=$1

validate_non_empty "PROJECT_NAME" $PROJECT_NAME

echo "# $PROJECT_NAME" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# ===============

echo "## Configuration:" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "Clone the repository" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "git clone git@github.com:bgord/journal.git --recurse-submodules" >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "Install packages" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "bun i" >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "Create env files" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "cp .env.example .env.local" >> "$OUTPUT_FILE"
echo "cp .env.example .env.test" >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "Start the app" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "./bgord-scripts/bun-local-server-start.sh" >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "Run the tests" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "./bgord-scripts/bun-test-run.sh" >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# ===============

echo "## Domain:" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "\`\`\`" >> "$OUTPUT_FILE"
tree modules/ | grep -v index.ts | sed -e :a -e '$d;N;2,2ba' -e 'P;D' >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# ===============

echo "## Infra:" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "\`\`\`" >> "$OUTPUT_FILE"
tree infra/ -I drizzle \
  | grep -v index.ts \
  | grep -v CHANGELOG.md \
  | sed -e :a -e '$d;N;2,2ba' -e 'P;D' >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
