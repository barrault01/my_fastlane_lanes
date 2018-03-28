#!/bin/bash -e
 
bundle exec fastlane match development
bundle exec fastlane match appstore
bundle exec fastlane match adhoc