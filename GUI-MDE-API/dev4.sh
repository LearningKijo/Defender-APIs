#!/bin/bash

# Specify the name of the ZIP file
zip_file_name="MicrosoftAuthenticator.app.zip"

# Specify the full path to the ZIP file
zip_file_path="/Users/luiza/Downloads/$zip_file_name"

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
