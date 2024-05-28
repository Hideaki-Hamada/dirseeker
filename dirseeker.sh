#!/bin/bash
#
# Simple directory checker
# Function to test a directory on a given URL
test_directory() {
    url=$1
    directory=$2

    # Curl the URL with the directory appended
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url/$directory/")

    # Check if response is 200 (OK)
    if [ "$response" = "200" ]; then
        echo "$directory found"
    fi
}

# Main script
read -p "Enter URL: " url

# List of common web directories to test
directories=("admin" "login" "wp-admin" "wp-login" "administrator" "phpmyadmin")

# Loop through directories and test each
for dir in "${directories[@]}"; do
    test_directory "$url" "$dir"
done
