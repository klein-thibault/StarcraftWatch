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

extension VideosViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: UICollectionViewDataSource Methods

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.videos.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: VideosCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(VideosCollectionViewCell.identifier,
                                                                                                   forIndexPath: indexPath) as! VideosCollectionViewCell
        let youtubeSearchResult = self.videos[indexPath.row]
        let video = youtubeSearchResult.video
        cell.setup(video)

        return cell
    }

    // MARK: UICollectionViewDelegate Methods

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let videoDetailVC = self.storyboard?
            .instantiateViewControllerWithIdentifier(VideoDetailViewController.videoDetailViewControllerIdentifier)
            as! VideoDetailViewController
        let youtubeSearchResult = self.videos[indexPath.row]
        videoDetailVC.video = youtubeSearchResult.video
        self.navigationController?.pushViewController(videoDetailVC, animated: true)
    }

    func collectionView(collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            return collectionView.dequeueReusableSupplementaryViewOfKind(kind,
                                                                         withReuseIdentifier: "VideosHeaderView",
                                                                         forIndexPath: indexPath)
        }
        fatalError("Invalid indexPath \(indexPath) in \(#function)")
    }

    func collectionView(collectionView: UICollectionView,
                        shouldUpdateFocusInContext context: UICollectionViewFocusUpdateContext) -> Bool {
        return true
    }
    
}
