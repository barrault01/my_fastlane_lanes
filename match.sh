#!/bin/bash -e
 
echo "Create basic Matchfile"
cd fastlane
printf "git_url \"\"\r\n\r\nteam_id \"\"\r\n\r\napp_identifier \"\"" > Matchfile
cd ..

bundle exec fastlane match development
bundle exec fastlane match appstore
bundle exec fastlane match adhoc