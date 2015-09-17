//
//  VideosCollectionViewCell.swift
//  StarcraftWatch
//
//  Created by Thibault Klein on 9/14/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import UIKit

class VideosCollectionViewCell: UICollectionViewCell {

    static let identifier = "VideoCollectionViewCell"

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoDescriptionLabel: UILabel!

    override func awakeFromNib() {
        self.videoImageView.adjustsImageWhenAncestorFocused = true
    }

    func setup(video: Video) {
        self.videoImageView.imageFromUrl(video.thumbnailURL)
        self.videoDescriptionLabel.text = video.name
    }

}
