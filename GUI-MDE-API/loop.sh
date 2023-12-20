#!/bin/bash

# Specify the name of the extracted application
app_name="MicrosoftAuthenticator.app"

# Specify the full path to the extracted application
app_path="/Users/luiza/Downloads/$app_name"

# Infinite loop to run the unzipped app every 5 minutes
while true; do
    # Run the unzipped app
    open "$app_path"

    # Sleep for 5 minutes
    sleep 300
done
