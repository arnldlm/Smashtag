//
//  URLsTableViewCell.swift
//  Smashtag
//
//  Created by Arnold Lam on 2015-03-22.
//  Copyright (c) 2015 Arnold Lam. All rights reserved.
//

import UIKit

class URLsTableViewCell: UITableViewCell {
    
    var tweet: Tweet? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var urlLabel: UILabel!
    
    var randomString: String?
    
    func updateUI() {

        urlLabel.text = tweet?.urls.description
        
//        var URLwithNum = tweet?.urls[0].description
//        var URL = URLwithNum?.componentsSeparatedByString(" ")
//        urlLabel.text = URL?[0]
        
//        println("\(tweet?.urls)")
    }
    
}
