//
//  ImagesTableViewCell.swift
//  Smashtag
//
//  Created by Arnold Lam on 2015-03-22.
//  Copyright (c) 2015 Arnold Lam. All rights reserved.
//

import UIKit

class ImagesTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    
    var tweet: Tweet? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        if let imageURL = tweet?.media.first?.url {
            let qualityOfService = Int(QOS_CLASS_USER_INITIATED.value)
            dispatch_async(dispatch_get_global_queue(qualityOfService, 0)) { () -> Void in // splits to new thread
            let imageData = NSData(contentsOfURL: imageURL)
                dispatch_async(dispatch_get_main_queue()) { // gets back on main thread to do UI stuff
                    if imageData != nil {
                        self.pictureImageView?.image = UIImage(data: imageData!)
                    }
                    else {
                        self.pictureImageView?.image = nil
                    }
                }
            }
        
        }

    }
}