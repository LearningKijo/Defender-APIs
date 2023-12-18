#!/bin/bash

# Specify the name of the extracted application
app_name="MicrosoftAuthenticator.app"

# Specify the full path to the extracted application
app_path="/Users/luiza/Downloads/$app_name"

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
