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
        let youtubeSearchResult = self.videos[indexPath.row]
        let video = youtubeSearchResult.video
        cell.setup(video)

        return cell
    }

    // MARK: UICollectionViewDelegate Methods
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let videoDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier(VideoDetailViewController.videoDetailViewControllerIdentifier) as! VideoDetailViewController
        videoDetailVC.video = self.videos[indexPath.row].video
        self.navigationController?.pushViewController(videoDetailVC, animated: true)
    }

    func collectionView(collectionView: UICollectionView, shouldUpdateFocusInContext context: UICollectionViewFocusUpdateContext) -> Bool {
        return true
    }

    func collectionView(collectionView: UICollectionView, didUpdateFocusInContext context: UICollectionViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        let nextCell = context.nextFocusedView
        var transform = CATransform3DIdentity;
        transform = CATransform3DScale(transform, 1.2, 1.2, 1.0)
        UIView.animateWithDuration(0.25) { () -> Void in
            nextCell?.layer.transform = transform
        }

        let prevCell = context.previouslyFocusedView
        transform = CATransform3DScale(transform, 0.8, 0.8, 1.0)
        UIView.animateWithDuration(0.25) { () -> Void in
            prevCell?.layer.transform = transform
        }
    }

}
