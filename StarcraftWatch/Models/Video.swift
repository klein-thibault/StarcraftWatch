//
//  Video.swift
//  StarcraftWatch
//
//  Created by Thibault Klein on 9/14/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import Foundation
import UIKit

struct Video {

    let id: String
    var URL: NSURL?
    let name: String
    let thumbnailURL: NSURL
    let description: String

    init(id: String, name: String, description: String, thumbnail: NSURL) {
        self.id = id
        self.name = name
        self.description = description
        self.thumbnailURL = thumbnail
    }

    static func defaultVideo() -> Video {
        return Video(
            id: "1",
            name: "Jaedong vs Lilbow - WCS EU S3 - Premier Group Stage Ro16 - Groupe D - 09/09/15",
//            url: NSURL(string: "https://www.youtube.com/watch?v=FaHd3WhtEi0")!,
            description: "Jaedong vs Lilbow!",
            thumbnail: NSURL(string: "https://i.ytimg.com/vi/77O8u_G21ps/hqdefault.jpg")!
        )
    }

    static func dummyVideos() -> Array<Video> {
        var videos = Array<Video>()
        for _ in 1...50 {
            videos.append(Video.defaultVideo())
        }
        return videos
    }

    func videoFormattedDescription() -> String {
        return self.name + "\n" + self.description
    }

    func videoFormattedURL() -> NSURL? {
        guard (self.URL != nil) else {
            return nil
        }

        let videosDict = HCYoutubeParser.h264videosWithYoutubeURL(self.URL)
        if let video720URL = videosDict["hd720"] as? String {
            return NSURL(string: video720URL)!
        }

        return nil
    }

}
