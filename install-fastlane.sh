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
printf "#import_from_git(url: 'git@github.com:barrault01/my_fastlane_lanes.git', path: 'fastlane/Fastfile')\r\nENV[\"DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS\"] =\"-t DAV\"\r\nfastlane_version \"2.85.0\"\r\n\r\ndefault_platform :ios\r\n\r\nplatform :ios do\r\n  \r\n after_all do |lane|\r\n   notification(message:\"Finished lane: #{lane}\")\r\n end\r\n\r\n  desc \"Create beta build\"\r\n  lane :beta do\r\n      match(type: \"adhoc\", readonly: true)\r\n      gym(configuration: \"Release\", silent: true, clean: true, export_method: 'ad-hoc',xcargs: \"ARCHIVE=YES\")\r\n      crashlytics\r\n  end\r\n\r\n  desc \"Create prod build\"\r\n  lane :prod do\r\n      match(type: \"appstore\", readonly: true)\r\n      gym(configuration: \"Release\", silent: true, clean: true,xcargs: \"ARCHIVE=YES\")\r\n      pilot(skip_submission: true, skip_waiting_for_build_processing: true)\r\n  end\r\n\r\n  desc \"Download all provisionning profiles\"\r\n  lane :matches do\r\n      match(type: \"appstore\", readonly: true)\r\n      match(type: \"development\", readonly: true)\r\n      match(type: \"adhoc\", readonly: true)\r\n  end\r\n\r\n  desc \"Download all provisionning profiles\"\r\n  lane :initial_matches do\r\n      match(type: \"appstore\")\r\n      match(type: \"development\")\r\n      match(type: \"adhoc\")\r\n  end\r\n\r\n\r\n error do |lane, exception|\r\n   notification(subtitle: \"Erro in lane: #{lane}\", message:\"Erro in lane: #{exception}\")\r\n end\r\n\r\nend\r\n" > Fastfile 

echo "###########"
echo "Installation completed: now just run: 'bundle exec fastlane' "
echo "###########"

echo "Create basic Matchfile"
printf "git_url \"\"\r\n\r\nteam_id \"\"\r\n\r\napp_identifier \"\"\r\n\rusername \"\"" > Matchfile
cd ..

echo "Remember to edit Matchfile"

echo "For initialize match run: "
echo "##########################################"
echo "## bundle exec fastlane initial_matches ##"
echo "##########################################"
