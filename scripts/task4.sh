#!/bin/bash

search_files() {
    local keyword=$1
    local directory=$2

    # checking files
    for file in "$directory"/*; do
        
        if [ -f "$file" ]; then
            # Search for keyword 
            while IFS= read -r line; do
                if [[ "$line" =~ $keyword ]]; then
                
                    echo "File: $file"
                    echo "Line number: $(grep -n "$line" "$file" | cut -d':' -f1)"
                    echo "Context: $line"
                    echo
                fi
            done < "$file"
        fi
    done
}

read -r -p "Enter keyword to search: " keyword
read -r -p "Enter directory path: " directory

search_files "$keyword" "$directory"
