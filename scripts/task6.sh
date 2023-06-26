#!/bin/bash
download_files() {
    local remoteHost=$1
    local remotePath=$2
    local localPath=$3

    ssh "$remoteHost" "cd \"$remotePath\" && tar cf - ./" | tar xf - -C "$localPath"
    echo "Files downloaded successfully"
}

# read input
read -r -p "Enter remote host: " remoteHost
read -r -p "Enter remote path: " remotePath
read -r -p "Enter local path: " localPath

remoteHost="vikrant@192.168.43.23"
remotePath="/home/vikrant/Music"
localPath="D:\IESoft"

download_files "$remoteHost" "$remotePath" "$localPath"
