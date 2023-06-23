#!/bin/bash

# download_files() {
#     local remote_host=$1
#     local remote_path=$2
#     local local_path=$3

#     ssh "$remote_host" "cd $remote_path && find . -type f -exec sh -c 'mkdir -p \"$local_path/$(dirname {})\" && cp -p {} \"$local_path/{}\"' \;"
# }

# read -p "Enter remote host: " remote_host
# read -p "Enter remote path: " remote_path
# read -p "Enter local path: " local_path

# download_files "$remote_host" "$remote_path" "$local_path"
