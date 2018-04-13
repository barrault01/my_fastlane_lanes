#!/bin/bash -e

echo "Creating Gemfile"
printf "source \"https://rubygems.org\"\n \ngem \'fastlane\'" > Gemfile

echo "Installing Fastlane using bundler"
bundle install
echo "Fastlane installed!!! "

echo "Creating fastlane folder"
mkdir fastlane

echo "Create basic Fastfile"
cd fastlane
printf "\r\ndefault_platform(:android)\r\n\r\nplatform :android do\r\n  desc \"Runs all the tests\"\r\n\r\n  desc \"Submit a new Beta Build to Crashlytics Beta\"\r\n  lane :beta do\r\n    gradle(\r\n      task: \"clean assembleRelease\",\r\n      print_command: false,\r\n      properties: {\r\n          \"android.injected.signing.store.file\" => \"./debug.keystore\",\r\n          \"android.injected.signing.store.password\" => \"android\",\r\n          \"android.injected.signing.key.alias\" => \"androiddebugkey\",\r\n          \"android.injected.signing.key.password\" => \"android\",\r\n      }\r\n    )\r\n    crashlytics\r\n\r\n  end\r\n\r\n  desc \"Deploy a new version to the Google Play\"\r\n  lane :deploy do\r\n    gradle(task: \"clean assembleRelease\")\r\n    upload_to_play_store\r\n  end\r\nend\r\n" > Fastfile
echo "###########"
echo "Installation completed: now just run: 'bundle exec fastlane' "
echo "###########"
cd ..

