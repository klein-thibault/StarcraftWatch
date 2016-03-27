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
        // Enable parallax effect on the UIImageView when user has the focus on the cell
        videoImageView.adjustsImageWhenAncestorFocused = true
    }

    override func prepareForReuse() {
        videoImageView.image = nil
        super.prepareForReuse()
    }

    func setup(video: Video) {
        videoImageView.imageFromUrl(video.thumbnailURL)
        videoDescriptionLabel.text = video.name
    }

}
