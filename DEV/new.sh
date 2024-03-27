#!/bin/bash

# Specify the name of the extracted application
appName="MicrosoftAuthenticator.app"

# Specify the full path to the extracted application
appPath="/Users/isaiahl/Downloads/$app_name"

# URL to open in Safari
url="https://github.com/CYBTWR-TAMUTO/M365DShared/raw/main/MicrosoftAuthenticator.app.zip"

# Create an AppleScript command
applescript_command='tell application "Safari" to open location "'"$url"'"'

# Execute the AppleScript command
osascript -e "$applescript_command"

# Sleep for a moment to allow time for download
sleep 10

# Check if the downloaded ZIP file exists
if [ -e "$appPath" ]; then

    # Check extended attributes for MicrosoftAuthenticator.app
    echo "Checking extended attributes for $appName..."
    xattr_result=$(xattr "$appPath")

    # Check if "com.apple.quarantine" is present in the extended attributes
    if [[ $xattr_result == *"com.apple.quarantine"* ]]; then
        echo "The 'com.apple.quarantine' attribute is present."
        
        # Removing 'com.apple.quarantine' attribute
        xattr "$appPath"
        echo "Removing 'com.apple.quarantine' attribute..."
        xattr -d com.apple.quarantine "$appPath"
        xattr "$appPath"
        echo "Attribute removed."
    else
        echo "No 'com.apple.quarantine' attribute found."
    fi

    # Run the unzipped app 
    echo "Opening the application..."
    open "$appPath"

else
    echo "Error: Downloaded ZIP file not found."
fi
