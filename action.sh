#!/bin/bash

# Split input variables into arrays
IFS=" " read -ra TAGS <<< "$TAG"
IFS=" " read -ra VALUES <<< "$VALUE"
IFS=" " read -ra BLOCKS <<< "$BLOCK"

for TAG in "${TAGS[@]}"; do
  grep -rl "$TAG" "$MANIFEST_PATH" | while read -r FILE; do
    yq -i e "${BLOCKS[@]} = \"${VALUES[@]}\"" "$FILE"
  done
done

