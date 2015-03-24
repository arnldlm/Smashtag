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
            let imageData = NSData(contentsOfURL: imageURL)
            if imageData != nil {
                pictureImageView?.image = UIImage(data: imageData!)
            }
            else {
                pictureImageView?.image = nil
            }
        }
        
    }

}
