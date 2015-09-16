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

    var videos = Video.dummyVideos()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.videosCollectionView.reloadData()

        Alamofire.request(.GET, "https://www.googleapis.com/youtube/v3/search?key=AIzaSyAsE2Is-wYoWoWzp56e6G7YTGmKGlsaGjk&channelId=UCU1nH5X8eC0aD3PkveRjjgw&part=snippet,id&order=date&maxResults=50", parameters: nil)
            .responseJSON { (request, ResponseSerializer, data) -> Void in
                print(data)
                // Returns all the videos for SC2 channel
                // Need to get all informations
                // Need to make another API call to get the video URL based on the video ID
        }
    }

}

