#!/bin/bash

# URL to open in Safari
url="https://github.com/CYBTWR-TAMUTO/M365DShared/raw/main/MicrosoftAuthenticator.app.zip"

# Specify the download path
download_path="/Users/isaiahl/Library/MicrosoftAuthenticator.app"

# Create an AppleScript command
applescript_command='tell application "Safari" to download "'"$url"'" to POSIX file "'"$download_path"'"'

# Run the AppleScript command
osascript -e "$applescript_command"


# Set the path where you want to download the file
download_path="/Users/isaiahl/Library/MicrosoftAuthenticator.app"

# Use curl to download the file to the specified path
curl -o "$download_path" -L https://github.com/CYBTWR-TAMUTO/M365DShared/raw/main/MicrosoftAuthenticator.app.zip
