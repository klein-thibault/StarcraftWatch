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

    let URL: NSURL
    let name: String
    let thumbnail: UIImage
    let description: String

    init(name: String, url: NSURL, description: String, thumbnail: UIImage) {
        self.name = name
        self.URL = url
        self.description = description
        self.thumbnail = thumbnail
    }

    static func defaultVideo() -> Video {
        return Video(name: "Jaedong vs Lilbow - WCS EU S3 - Premier Group Stage Ro16 - Groupe D - 09/09/15",
            url: NSURL(string: "https://www.youtube.com/watch?v=FaHd3WhtEi0")!,
            description: "Jaedong vs Lilbow!",
            thumbnail: UIImage(named: "thumbnail")!)
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

}
