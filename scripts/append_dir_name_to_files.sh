#!/bin/bash

# Check if a directory argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Assign the provided directory to a variable
BASE_DIR=$1

# Traverse through all subdirectories
for dir in "$BASE_DIR"/*/; do
    # Remove the trailing slash to get the directory name
    dir=${dir%*/}

    # Get the name of the directory (basename)
    dir_name=$(basename "$dir")

    # Loop through all files in the subdirectory
    for file in "$dir"/*; do
        # Continue only if it's a regular file
        if [ -f "$file" ]; then
            # Extract filename and extension
            filename=$(basename -- "$file")
            extension="${filename##*.}"
            filename="${filename%.*}"

            # Append the directory name to the file
            new_filename="${filename}_${dir_name}_0000.${extension}"
            mv "$file" "$dir/$new_filename"
        fi
    done
done
