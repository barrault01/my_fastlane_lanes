## My fastlane lanes :rocket:

By the end of 2014, I discovered a project that was going to save me hours every weeks: [fastlane](https://github.com/fastlane/fastlane) by [KrauseFx](https://github.com/KrauseFx). After using it locally on my mac, setting it up on my college's macs, putting it on our CI, today is part of our daily routine. I created lanes that we share between our projects, this repository contain this lanes. It is not perfect but I hope it will help.

## What can I do with your lanes?

#### Change version and build number

- `change_version_number`: Change version number with prompt
- `patch`: Increment by one the project version number (ex: 2.0.1 => 2.0.2)
- `minor`: Increment by one the project version number (ex: 2.0.1 => 2.1.0)
- `major`: Increment by one the project version number (ex: 2.0.1 => 3.0.0)
- `bump`: Increment build number

#### Work on apple developer portal

- `device`: Add new device to apple portal 
- `rematch`: Renew provisionning profiles
#### Automate your git process

- `pr`: Create a pull request from your terminal
- `tag_the_release`: Create a tag with the date of today using build number and version number
 
#### Manage your cocoapods repositories

- `install_private_repo`: Install you private pods repository on your mac or on the CI
- `publish_pod`: Publish a new version of you pod automaticaly
- `tag_and_pod`: Publish a new version of you pod automaticaly after creating a new tag based on the project version number
- `lint_pod`: Lint the .podspec

#### Test and build your iOS apps

- `snap`: Create Snapshots to tests if autolayout is OK
- `testing`: Test your project and generate logs
- `building_time`: Generate reports for building time.
- `prod`: Create a new app in production and send it to apple
- `fabric`: Create a beta version of the app with a custom icon and then send it to fabric
- `submit`: Submit last build to the app store

## How to use it 
### Project configuration

To use our lanes, fork this repository and just add a line on the top of your fastfile:

	import_from_git(url: 'git@github.com:YOUR_USERNAME/my_fastlane_lanes.git', path: 'fastlane/Fastfile') 

Then declare the informations of your project like this: 

	def proj 
 	{
 		plist: "./PATH_TO_PROJECT/Info.plist",
 		xcodeproj: "./PATH_TO_PROJECT.xcodeproj/",
	 	repo_url: "https://github.com/MyTeam/fastlane",
     	scheme: "MyProject",
     	scheme_prod: "MyProject-Prod",
     	scheme_qa: "MyProject-Beta,
     	app_identifier_for_qa: "my.company.myapp.beta", #optional use this if you have different app identifier between QA and prod
        fabric_testers: 'vivapro---ios',
        default_branch: 'develop'

	}

If your project is a pod: 

	def cocoapods 
	{
		private_repo: "my_private_repo",
    	private_repo_name: "my_private_repo",
		private_repo_git_url: "git@github.com:MyTeam/my_private_repo.git",
		podspec: "./MyPod.podspec",
		pod_name: "MyPod"
	}



### To use our lanes 

	fastlane THE_NAME_OF_THE_LANE

## Troubleshooting 

Check that this variable are setted: 

	ENV["CRASHLYTICS_API_TOKEN"] = 
	ENV["CRASHLYTICS_BUILD_SECRET"] = 
	ENV["SLACK_URL"] = 
	ENV["DELIVER_PASSWORD"] = 
	ENV["PILOT_USERNAME"] = 
	ENV["MATCH_PASSWORD"] = 
	ENV["DELIVER_USER"] = 
	ENV["GITHUB_TOKEN"] = 
	team_id = 

## Not resolving?

Please [submit an issue](https://github.com/barrault01/my_fastlane_lanes/issues) on GitHub and ping me on [Twitter](https://twitter.com/_ant_one) with the link of the issue.


