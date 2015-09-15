//
//  VideosViewController.swift
//  StarcraftWatch
//
//  Created by Thibault Klein on 9/14/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import UIKit

class VideosViewController: UIViewController {

    @IBOutlet weak var videosCollectionView: UICollectionView!

    var videos = Video.dummyVideos()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.videosCollectionView.reloadData()
    }

}

