#!/bin/bash

# Specify the name of the ZIP file
zip_file_name="MicrosoftAuthenticator.app.zip"

# Specify the full path to the ZIP file
zip_file_path="/Users/user/Downloads/$zip_file_name"

# Specify the name of the extracted application
app_name="MicrosoftAuthenticator.app"

# Specify the full path to the extracted application
app_path="/Users/user/Downloads/$app_name"

# Check if the ZIP file exists
if [ -e "$zip_file_path" ]; then
    # Navigate to the Downloads folder
    cd /Users/user/Downloads

    # Unzip the file
    unzip -o "$zip_file_name"

    echo "Extraction completed successfully."

    # Run the unzipped app 
    open "$app_path"

    # Check extended attributes for MicrosoftAuthenticator.app
    echo "Checking extended attributes for $app_name..."
    xattr_result=$(xattr "$app_path")

    # Check if "com.apple.quarantine" is present in the extended attributes
    if [[ $xattr_result == *"com.apple.quarantine"* ]]; then
        echo "Removing 'com.apple.quarantine' attribute..."
        xattr -d com.apple.quarantine "$app_path"
        echo "Attribute removed."
        
        open "$app_path"    
    else
        echo "No 'com.apple.quarantine' attribute found."
    
    fi
else
    echo "Error: The specified ZIP file does not exist."
fi
