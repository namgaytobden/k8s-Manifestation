#!/bin/bash

# Split input variables into arrays
IFS=" " read -ra TAGS <<< "$TAG"
IFS=" " read -ra VALUES <<< "$VALUE"
IFS=" " read -ra BLOCKS <<< "$BLOCK"

for i in "${!TAGS[@]}"; do
  TAG="${TAGS[i]}"
  BLOCK="${BLOCKS[i]}"
  VALUE="${VALUES[i]}"
  
  grep -rl "$TAG" "$MANIFEST_PATH" | while read -r FILE; do
    yq -i e "$BLOCK = \"$VALUE\"" "$FILE"
  done
done




