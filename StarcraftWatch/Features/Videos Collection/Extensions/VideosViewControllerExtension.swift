//
//  VideosViewControllerExtension.swift
//  StarcraftWatch
//
//  Created by Thibault Klein on 9/14/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import UIKit

extension VideosViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: UICollectionViewDataSource Methods
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.videos.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: VideosCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(VideosCollectionViewCell.identifier, forIndexPath: indexPath) as! VideosCollectionViewCell
        // TODO: use real video data
        let video = self.videos[indexPath.row]
        cell.setup(video)
        return cell
    }

    // MARK: UICollectionViewDelegate Methods
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let videoDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier(VideoDetailViewController.videoDetailViewControllerIdentifier)
        self.navigationController?.pushViewController(videoDetailVC!, animated: true)
    }

}
