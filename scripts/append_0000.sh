#!/bin/bash

# Loop through each file in the current directory
for file in *; do
    # Check if the item is a file
    if [ -f "$file" ]; then
        # Rename the file by appending 0000 before its extension
        mv "$file" "${file%.*}_0000.${file##*.}"
    fi
done
