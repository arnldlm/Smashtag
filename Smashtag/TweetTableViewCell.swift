 //
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by Arnold Lam on 2015-03-21.
//  Copyright (c) 2015 Arnold Lam. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    var tweet: Tweet? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var tweetImageView: UIImageView!
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var tweetDateLabel: UILabel!

    func updateUI() {
        // reset any existing tweet information
        tweetTextLabel?.attributedText = nil // attributeText for NSAttributedString
        tweetScreenNameLabel?.text = nil
        tweetImageView?.image = nil
        tweetDateLabel?.text = nil
        
        //load new information from our tweet (if any)
        if let tweet = self.tweet {
            tweetTextLabel?.text = tweet.text
            if tweetTextLabel?.text != nil {
                for _ in tweet.media {
                    tweetTextLabel.text! += " 📷"
                }
            }
        }
        tweetScreenNameLabel?.text = "\(tweet!.user)" // tweet.user.description
        
        if let profileImageURL = tweet?.user.profileImageURL {
            let qualityOfService = Int(QOS_CLASS_USER_INITIATED.value)
            dispatch_async(dispatch_get_global_queue(qualityOfService, 0)) { () -> Void in // splits to new thread
                let imageData = NSData(contentsOfURL: profileImageURL)
                dispatch_async(dispatch_get_main_queue()) { // gets back on main thread to do UI stuff
                    if imageData != nil {
                        self.tweetImageView?.image = UIImage(data: imageData!)
                    } else {
                        self.tweetImageView?.image = nil
                    }
                }
            }
        }

        let formatter = NSDateFormatter()
        if NSDate().timeIntervalSinceDate(tweet!.created) > 24*60*60 {
            formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        } else {
            formatter.timeStyle = NSDateFormatterStyle.ShortStyle
        }
        tweetDateLabel?.text = formatter.stringFromDate(tweet!.created)
    }
}
