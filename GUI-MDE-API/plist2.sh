#!/bin/bash

# Specify the name of the extracted application
app_name="MicrosoftAuthenticator.app"

# Specify the full path to the extracted application
app_path="/Users/luiza/Downloads/$app_name"

# Specify the directory for LaunchAgent Plist file
launch_agents_dir="/Users/luiza/Documents/MyLaunchAgents/"

# Create Plist file
plist_file="$launch_agents_dir/com.example.run_app.plist"

# Create LaunchAgents directory if it doesn't exist
mkdir -p "$launch_agents_dir"

cat <<EOF >"$plist_file"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.example.run_app</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/open</string>
        <string>$app_path</string>
    </array>
    <key>StartInterval</key>
    <integer>60</integer> <!-- Run every 60 seconds -->
</dict>
</plist>
EOF

echo "Plist file created at: $plist_file"
