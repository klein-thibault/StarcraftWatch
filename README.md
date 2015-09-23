# StarcraftWatch

Starcraft Watch is a tvOS prototype I worked on as an introduction to the new Apple TV operating system.

The app is a YouTube video player, pulling videos from [SC2 Pro Gaming](https://www.youtube.com/user/SC2OGTV) french Starcraft 2 channel. The [YouTube Data API](https://developers.google.com/youtube/v3/?hl=en) is being used to pull all the video informations, and [HCYoutubeParser](https://github.com/hellozimi/HCYoutubeParser) for parsing the YouTube URL and get the actual video URL. The reason why I'm using HCYoutubeParser is because YouTube doesn't allow you to stream videos directly from their URLs, you have to use their player. The problem is the SDK is using web views, which are not allowed on tvOS. The only way I found is to use this URL parser to get the actual video URL, and then stream the video using the native AVFoundation video player.

### How to start the app

Since tvOS has just released, Cocoapods has not been udpated yet to support tvOS (at least not on the public release). I'm using a specific Gemfile to install the pods with a tvOS Cocoapods compatible version. To be able to install the pods you will have to install `bundle`. 

* In your terminal do `$ gem install bundle`.
*  In the project root folder do `$ bundle install` to install the Gemfile specific Cocoapod
*  From now on, you need to use `bundle exec` before every `pod` command, so if you want to install the pods, do `$ bundle exec pod install`
*  You should now be able to run the app on the Apple TV simulator (or the actual Apple TV if you are a lucky developer)!

You can find more details from the Cocoapods Github [here](https://github.com/CocoaPods/Core/pull/263) and the Cocoapods documentation about using Gemfiles [here](http://guides.cocoapods.org/using/a-gemfile.html).

### Contact

If you have any questions feel free to contact me at klein.thibault@gmail.com.
Also your issues and pull requests are welcome to improve the code.