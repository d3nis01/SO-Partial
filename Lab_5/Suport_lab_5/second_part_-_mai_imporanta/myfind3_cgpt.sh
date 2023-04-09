#!/bin/bash

function print_tree {
  local dir="$1"
  local prefix="$2"
  local indent="${prefix}├── "

  # Print the current directory
  echo "${prefix}└── $(basename "$dir")/"

  # Print the contents of the current directory
  for file in "$dir"/*; do
    if [ -d "$file" ]; then
      # If the file is a directory, recursively print its contents
      print_tree "$file" "${prefix}    "
    else
      # If the file is a regular file, print its name with an indent
      echo "${indent}$(basename "$file")"
    fi
  done
}

# Check if a directory was provided as an argument
if [ $# -eq 0 ]; then
  # If no directory was provided, use the home directory
  dir="$HOME"
else
  # Use the specified directory
  dir="$1"
fi

# Check if the specified directory exists
if [ ! -d "$dir" ]; then
  echo "Error: $dir is not a directory."
  exit 1
fi

# Call the print_tree function with the specified directory and an empty prefix
print_tree "$dir" ""