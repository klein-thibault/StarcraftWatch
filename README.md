# StarcraftWatch

Starcraft Watch is a tvOS prototype I worked on as an introduction to the new Apple TV operating system.

The app is a YouTube video player, pulling videos from [SC2 Pro Gaming](https://www.youtube.com/user/SC2OGTV) french Starcraft 2 channel. The [YouTube Data API](https://developers.google.com/youtube/v3/?hl=en) is being used to pull all the video informations, and [HCYoutubeParser](https://github.com/hellozimi/HCYoutubeParser) for parsing the YouTube URL and get the actual video URL. The reason why I'm using HCYoutubeParser is because YouTube doesn't allow you to stream videos directly from their URLs, you have to use their player. The problem is the SDK is using web views, which are not allowed on tvOS. The only way I found is to use this URL parser to get the actual video URL, and then stream the video using the native AVFoundation video player.

### How to start the app


* Make sure to use cocoapods with version superior or equal to `0.39.0`
* In your terminal do `$ pod install`.


### Contact

If you have any questions feel free to contact me at klein.thibault@gmail.com.
Also your issues and pull requests are welcome to improve the code.