#!/bin/bash

echo "Connecting to VM... "
echo "========================="


CURRENT_PATH=$(cd -- "$(dirname "$0")" && pwd -P)

IP=$1

check_file_exists() {
    local file_path="$1"

    # Check if the file exists
    if [ -f "$file_path" ]; then
        echo "File '$file_path' exists!"
    else
        echo "File '$file_path' does not exist."
        exit 1
    fi
}

SSH_PATH="$CURRENT_PATH/key.pem"

check_file_exists $SSH_PATH

ssh -i $SSH_PATH ec2-user@$IP