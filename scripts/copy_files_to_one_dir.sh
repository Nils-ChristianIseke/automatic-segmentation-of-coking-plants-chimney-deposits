#!/bin/bash

# Check if the source and target directory arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <target_directory>"
    exit 1
fi

# Assign the provided arguments to variables
SOURCE_DIR=$1
TARGET_DIR=$2

# Create the target directory if it does not exist
mkdir -p "$TARGET_DIR"

# Copy files from each subdirectory to the target directory
for dir in "$SOURCE_DIR"/*; do
    # Check if it's a directory
    if [ -d "$dir" ]; then
        # Copy all files from this directory to the target directory
        cp "$dir"/* "$TARGET_DIR/"
    fi
done

echo "Files copied to $TARGET_DIR"
