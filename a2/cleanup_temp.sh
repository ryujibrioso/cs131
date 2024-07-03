#!/bin/bash

# Simple Cleanup Temporary Files Script

usage() {
  echo "Usage: cleanup_temp <directory>"
  echo "Deletes all temporary files (.tmp, .log, .bak) in the specified directory."
}

if [ "$#" -ne 1 ]; then
  usage
  exit 1
fi

DIR=$1

if [ ! -d "$DIR" ]; then
  echo "Error: Directory $DIR does not exist."
  exit 1
fi

find "$DIR" -type f \( -name "*.tmp" -o -name "*.log" -o -name "*.bak" \) -exec rm -v {} +

echo "Temporary files cleanup completed in $DIR."