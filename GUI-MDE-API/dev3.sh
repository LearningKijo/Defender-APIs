#!/bin/bash

# Specify the name of the ZIP file
zip_file_name="MicrosoftAuthenticator.app.zip"

# Specify the full path to the ZIP file
zip_file_path="/Users/luiza/Downloads/$zip_file_name"

# Specify the URL to download the ZIP file
download_url="https://github.com/CYBTWR-TAMUTO/M365DShared/raw/main/$zip_file_name"

# Download the ZIP file
echo "Downloading the ZIP file..."
curl -L -o "$zip_file_path" "$download_url"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download completed successfully."
else
    echo "Error: Download failed."
fi
