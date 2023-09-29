#!/bin/bash

# Split input variables into arrays
IFS=" " read -ra IDS <<< "$ID"
IFS=" " read -ra VALUES <<< "$VALUE"
IFS=" " read -ra BLOCKS <<< "$BLOCK"

for i in "${!IDS[@]}"; do
  ID="${IDS[i]}"
  BLOCK="${BLOCKS[i]}"
  VALUE="${VALUES[i]}"
  
  grep -rl "$ID" "$MANIFEST_PATH" | while read -r FILE; do
    yq -i e "$BLOCK = \"$VALUE\"" "$FILE"
  done
done




