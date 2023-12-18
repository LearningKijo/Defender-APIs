#!/bin/bash

# URL to open in Safari
url="https://github.com/CYBTWR-TAMUTO/M365DShared/raw/main/MicrosoftAuthenticator.app.zip"

# Create an AppleScript command
applescript_command='tell application "Safari" to open location "'"$url"'"'

# Execute the AppleScript command
osascript -e "$applescript_command"
