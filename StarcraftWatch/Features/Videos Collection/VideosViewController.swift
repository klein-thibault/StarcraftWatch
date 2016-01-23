//
//  VideosViewController.swift
//  StarcraftWatch
//
//  Created by Thibault Klein on 9/14/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import UIKit
import Alamofire

class VideosViewController: UIViewController {

    @IBOutlet weak var videosCollectionView: UICollectionView!

    let videosURL = "https://www.googleapis.com/youtube/v3/search?key=AIzaSyAsE2Is-wYoWoWzp56e6G7YTGmKGlsaGjk&channelId=UCU1nH5X8eC0aD3PkveRjjgw&part=snippet,id&order=date&maxResults=50&type=video"
    var videos = Array<YouTubeSearchResult>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(.GET, self.videosURL).responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                return
            }
            let JSON: NSDictionary = response.result.value as! NSDictionary
            let items = JSON["items"] as! NSArray
            for item in items {
                let youtubeSearchItem = YouTubeSearchResult(jsonDict: item as! NSDictionary)
                self.videos.append(youtubeSearchItem)
            }
            self.videosCollectionView.reloadData()

        }
    }

}

