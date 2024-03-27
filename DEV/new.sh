#!/bin/bash

# Set the URL to be downloaded
url="https://github.com/CYBTWR-TAMUTO/M365DShared/raw/main/MicrosoftAuthenticator.app.zip"

# Set the download location
download_location="/Users/isaiahl/Library/"

# Set the name of the downloaded ZIP file
zip_file_name="MicrosoftAuthenticator.app.zip"

# Create an AppleScript command to download the file using Safari
applescript_command='tell application "Safari" to download URL "'"$url"'" to file "'"$download_location$zip_file_name"'"'

# Execute the AppleScript command
osascript -e "$applescript_command"
