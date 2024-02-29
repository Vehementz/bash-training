#!/bin/bash

# Script to search for a specified pattern in files recursively

# Check if the user has entered a pattern to search for
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <pattern>"
    exit 1
fi

pattern=$1

# Use grep to search for the pattern recursively
# -r or --recursive: Read all files under each directory, recursively
# --color=auto: Highlight the matching text
# -n: Show the line number of each match
echo "Searching for pattern '$pattern' in files recursively..."
grep --color=auto -rn "$pattern" .

