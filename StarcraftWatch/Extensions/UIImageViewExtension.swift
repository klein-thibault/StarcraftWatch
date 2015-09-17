//
//  UIImageViewExtension.swift
//  StarcraftWatch
//
//  Created by Thibault Klein on 9/16/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import UIKit

extension UIImageView {

    public func imageFromUrl(URL: NSURL) {
        let request = NSURLRequest(URL: URL, cachePolicy: .UseProtocolCachePolicy, timeoutInterval: 60)
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        let imageData = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if let imageData = data {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.image = UIImage(data: imageData)
                })
            }
        })
        imageData.resume()
    }

}
