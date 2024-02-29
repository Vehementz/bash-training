#!/bin/bash

set -o emacs
complete -d search_dir

read -ep "Enter the directory you want to search in: " search_dir
read -p "Enter the term you want to search for: " search_term

grep -r "$search_term" "$search_dir"


