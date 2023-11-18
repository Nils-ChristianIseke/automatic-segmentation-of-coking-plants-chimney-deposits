#!/bin/bash

# Starting number
counter=1

# Loop through each file in the current directory
for file in *; do
    # Check if the file is a regular file
    if [[ -f "$file" && "$file" == *"0000"* ]]; then
        # Format the counter with leading zeros
        formatted_counter=$(printf "%03d" $counter)
        
        # Construct new file name by replacing '0000' with the formatted counter
        new_file_name="${file//0000/$formatted_counter}"

        # Rename the file
        mv "$file" "$new_file_name"

        # Increment the counter
        ((counter++))
    fi
done
