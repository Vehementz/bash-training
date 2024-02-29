#!/bin/bash

# Define pattern options
declare -A patterns
patterns[1]="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" # Email address
patterns[2]="([0-9]{1,3}\.){3}[0-9]{1,3}" # IP address
patterns[3]="appkey" # Contains "appkey"

echo "Available patterns to search for:"
for key in "${!patterns[@]}"; do
    case $key in
        1) echo "$key) Email address";;
        2) echo "$key) IP address";;
        3) echo "$key) Lines containing 'appkey', excluding in file 'filesearch'";;
    esac
done

# Prompt for choice
read -rp "Enter the number corresponding to the pattern you want to search for: " choice

# Validate choice and get pattern
pattern=${patterns[$choice]}
if [ -z "$pattern" ]; then
    echo "Invalid choice. Exiting."
    exit 1
fi

# Perform the search
echo "Searching for pattern: $pattern"
if [ "$choice" -eq 3 ]; then
  # Special handling for choice 3 to exclude 'filesearch'
  find . ! -name "filesearch" -type f -exec grep --color=auto -nH "$pattern" {} +
else
  grep --color=auto -rnP "$pattern" .
fi
