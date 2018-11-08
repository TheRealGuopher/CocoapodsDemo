# CocoapodsDemo

If you cloned the repo and ran it right away but it doesn't work, make sure to get your API key from OpenWeatherMap.org or go to the #general Slack channel

To install Cocoapods...

Go to your project's root directory in Terminal and enter, "sudo gem install cocoapods". If you're prompted to type your password, this is your Mac's password.

While in Terminal, type, "pod init" to initialize the Podfile.

In order to install a Cocoapod such as "Alamofire", type, "vim Podfile" in terminal and type in "pod 'Alamofire' '~> 4.7'"

Here's a screenshot where I pasted the command: https://ibb.co/f5Ac8V

Make sure to exit Vim. Then type in "pod install" in Terminal. This will install the "Alamofire" Cocoapod.

You will have to open the new .xcworkspace file instead of .xcodeproj file to use your Cocoapods. Go ahead back to your project file and open that .xcworkspace file. You will see your Cocoapods on the left hand side! Be sure to import your Cocoapod at the top of the .swift file when you want to use it such as, "import Alamofire"
