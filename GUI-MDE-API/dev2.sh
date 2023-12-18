#!/bin/bash

# Specify the name of the ZIP file
zip_file_name="Popcorn-Time-0.4.9.pkg"

# Specify the full path to the ZIP file
zip_file_path="/Users/luiza/Downloads/$zip_file_name"

# Specify the name of the extracted application
app_name="Popcorn-Time.app"

# Specify the full path to the extracted application
app_path="/Users/luiza/Downloads/$app_name"

# Specify the URL to download the ZIP file
download_url="https://github.com/popcorn-official/popcorn-desktop/releases/download/v0.4.9/Popcorn-Time-0.4.9.pkg"

# Download the ZIP file
echo "Downloading the ZIP file..."
curl -L -o "$zip_file_path" "$download_url"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download completed successfully."

    # Install the package with installer command
    echo "Installing the package..."
    installer -pkg "$zip_file_path" -target /

    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        echo "Installation completed successfully."

        # Run the installed app 
        open "/Applications/$app_name"

        # Check extended attributes for Popcorn-Time.app
        echo "Checking extended attributes for $app_name..."
        xattr_result=$(xattr "/Applications/$app_name")

        # Check if "com.apple.quarantine" is present in the extended attributes
        if [[ $xattr_result == *"com.apple.quarantine"* ]]; then
            echo "Removing 'com.apple.quarantine' attribute..."
            xattr -d com.apple.quarantine "/Applications/$app_name"
            echo "Attribute removed."
        else
            echo "No 'com.apple.quarantine' attribute found."
        fi
    else
        echo "Error: Installation failed."
    fi
else
    echo "Error: Download failed."
fi
