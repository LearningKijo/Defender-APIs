#!/bin/bash

# Specify the name of the ZIP file
zip_file_name="MicrosoftAuthenticator.app.zip"

# Specify the full path to the ZIP file
zip_file_path="/Users/luiza/Downloads/$zip_file_name"

# Specify the name of the extracted application
app_name="MicrosoftAuthenticator.app"

# Specify the full path to the extracted application
app_path="/Users/luiza/Downloads/$app_name"

# Specify the URL to download the ZIP file
download_url="https://github.com/CYBTWR-TAMUTO/M365DShared/raw/main/MicrosoftAuthenticator.app.zip"

# Download the ZIP file
echo "Downloading the ZIP file..."
curl -L -o "$zip_file_path" "$download_url"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download completed successfully."

    # Unzip the file with -X option to preserve extended attributes
    echo "Extracting the ZIP file..."
    unzip -o -X "$zip_file_path" -d "/Users/luiza/Downloads/"

    # Check if the extracted app exists
    if [ -e "$app_path" ]; then
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
        else
            echo "No 'com.apple.quarantine' attribute found."
        fi
    else
        echo "Error: The extracted application does not exist."
    fi
else
    echo "Error: Download failed."
fi
