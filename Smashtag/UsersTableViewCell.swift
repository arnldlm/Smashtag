//
//  UsersTableViewCell.swift
//  Smashtag
//
//  Created by Arnold Lam on 2015-03-22.
//  Copyright (c) 2015 Arnold Lam. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    var tweet: Tweet? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        
    }

}
