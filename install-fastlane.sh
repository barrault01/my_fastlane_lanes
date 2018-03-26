#!/bin/bash -e

echo "Creating Gemfile"
printf "source \"https://rubygems.org\"\n \ngem \'fastlane\'" > Gemfile

echo "Installing Fastlane using bundler"
bundle install
echo "Fastlane installed!!! "

echo "Creating fastlane folder"
mkdir fastlane

echo "Create empty Fastfile"
cd fastlane

printf "import_from_git(url: 'git@github.com:barrault01/my_fastlane_lanes.git', path: 'fastlane/Fastfile')\r\nfastlane_version \"2.85.0\"\r\n\r\ndefault_platform :ios\r\n\r\nplatform :ios do\r\n\r\n  \r\n after_all do |lane|\r\n   notification(message:\"Finished lane: #{lane}\")\r\n end\r\n\r\n error do |lane, exception|\r\n   notification(subtitle: \"Erro in lane: #{lane}\", message:\"Erro in lane: #{exception}\")\r\n end\r\n\r\nend\r\n" > Fastfileprintf "fastlane_version \"2.85.0\"\r\n\r\ndefault_platform :ios\r\n\r\nplatform :ios do\r\n\r\n  \r\n after_all do |lane|\r\n   notification(message:\"Finished lane: #{lane}\")\r\n end\r\n\r\n error do |lane, exception|\r\n   notification(subtitle: \"Erro in lane: #{lane}\", message:\"Erro in lane: #{exception}\")\r\n end\r\n\r\nend\r\n" > Fastfile

echo "###########"
echo "Installation completed: now just run: 'bundle exec fastlane' "
echo "###########"
