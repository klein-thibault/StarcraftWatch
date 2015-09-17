//
//  YouTubeSearchResult.swift
//  StarcraftWatch
//
//  Created by Thibault Klein on 9/16/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import Foundation

struct YouTubeSearchResult {

    let etag: String
    let kind: String
    let video: Video

    init(jsonDict: NSDictionary) {
        self.etag = jsonDict["etag"] as! String
        self.kind = jsonDict["kind"] as! String

        let idDict = jsonDict["id"] as! NSDictionary
        let videoId = idDict["videoId"] as! String
        let snippetDict = jsonDict["snippet"] as! NSDictionary
        let thumbnailsDict = snippetDict["thumbnails"] as! NSDictionary
        let mediumThumbnailDict = thumbnailsDict["medium"] as! NSDictionary
        let thumbnailStr = mediumThumbnailDict["url"] as! String
        let largeThumbnailDict = thumbnailsDict["high"] as! NSDictionary
        let largeThumbnailStr = largeThumbnailDict["url"] as! String
        let title = snippetDict["title"] as! String
        let description = snippetDict["description"] as! String
        self.video = Video(
            id: videoId,
            name: title,
            description: description,
            thumbnail: NSURL(string: thumbnailStr)!,
            largeThumbnailURL: NSURL(string: largeThumbnailStr)!
        )
    }
}