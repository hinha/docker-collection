#!/bin/sh

INPUT_FILE="$1"
OUTPUT_FILE="$2"

if [ -z "$INPUT_FILE" ] || [ -z "$OUTPUT_FILE" ]; then
#   echo "Usage: $0 input.yml output.yml"
  exit 1
fi

echo "# Environment loaded:"
env | grep '^[A-Z_][A-Z0-9_]*=' | while IFS='=' read -r key value; do
  echo "parse env: $key: ***"
done

grep -oE '\$\{env:[A-Za-z0-9_]+\}' "$INPUT_FILE" | sed 's/[$\{\}]//g' | sed 's/env://' | while read -r VAR; do
  eval "VALUE=\"\$$VAR\""
  if [ -n "$VALUE" ]; then
    sed -i "s|\${env:$VAR}|$VALUE|g" "$INPUT_FILE"
  fi
done