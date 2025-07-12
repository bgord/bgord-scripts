#!/bin/bash

source bgord-scripts/base.sh
setup_base_config

OUTPUT_FILE="readme.md"

PACKAGE_NAME=$1

validate_non_empty "PACKAGE_NAME" $PACKAGE_NAME

echo "# $PACKAGE_NAME" > "$OUTPUT_FILE"
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

echo "Run the tests" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "./bgord-scripts/test-run.sh" >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# ===============

echo "## Files:" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "\`\`\`" >> "$OUTPUT_FILE"
tree src/ | grep -v index.ts | sed -e :a -e '$d;N;2,2ba' -e 'P;D' >> "$OUTPUT_FILE"
echo "\`\`\`" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
