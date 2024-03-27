#!/bin/bash

# URL to open in Safari
url="https://github.com/CYBTWR-TAMUTO/M365DShared/raw/main/MicrosoftAuthenticator.app.zip"

# Specify the download path
download_path="/Users/isaiahl/Library/MicrosoftAuthenticator.app"

# Create an AppleScript command
applescript_command='tell application "Safari" to download "'"$url"'" to POSIX file "'"$download_path"'"'

# Run the AppleScript command
osascript -e "$applescript_command"
