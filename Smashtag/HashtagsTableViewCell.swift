//
//  HashtagsTableViewCell.swift
//  Smashtag
//
//  Created by Arnold Lam on 2015-03-22.
//  Copyright (c) 2015 Arnold Lam. All rights reserved.
//

import UIKit

class HashtagsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hashtagLabel: UILabel!
    var stringToPrint: String? = ""
    
    var tweet: Tweet? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        var HashtagWithNum = tweet?.hashtags.first?.description
        var hashtag = HashtagWithNum!.componentsSeparatedByString(" ")
        hashtagLabel.text = hashtag[0]
    }

}
