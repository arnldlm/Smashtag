//
//  MentionsTableViewController.swift
//  Smashtag
//
//  Created by Arnold Lam on 2015-03-22.
//  Copyright (c) 2015 Arnold Lam. All rights reserved.
//

import UIKit

class MentionsTableViewController: UITableViewController {

    var mentions: Tweet? {
        didSet {
            placeMentionItemsInStack()
        }
    }
    
    var MentionItemsStack = [String?]()
    var MentionItemsStackCopy = [String?]()
    
    private struct Storyboard {
        static let imagesCellReuseIdentifier = "imagesCell"
        static let urlsCellReuseIdentifier = "urlsCell"
        static let hashtagsCellResuseIdentifier = "hashtagsCell"
        static let usersCellReuseIdentifier = "userMentionsCell"
        static let emptyCellReuseIdentifier = "emptyCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func placeMentionItemsInStack() {
        if !mentions!.userMentions.isEmpty {
            MentionItemsStack.append("Users")
        }
        if !mentions!.hashtags.isEmpty {
            MentionItemsStack.append("Hashtags")
        }
        if !mentions!.urls.isEmpty {
            MentionItemsStack.append("URLs")
        }
        if !mentions!.media.isEmpty {
            MentionItemsStack.append("Images")
        }
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return MentionItemsStack.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if !MentionItemsStack.isEmpty {
            if let identifier = MentionItemsStack.removeLast() {
                switch identifier {
                    case "Users":
                        let userMentionCell = tableView.dequeueReusableCellWithIdentifier(Storyboard.usersCellReuseIdentifier, forIndexPath: indexPath) as UsersTableViewCell
                        userMentionCell.tweet = mentions
                        return userMentionCell
                    case "Hashtags":
                        let hashtagCell = tableView.dequeueReusableCellWithIdentifier(Storyboard.hashtagsCellResuseIdentifier, forIndexPath: indexPath) as HashtagsTableViewCell
                        hashtagCell.tweet = mentions
                        return hashtagCell
                    case "URLs":
                        let urlCell = tableView.dequeueReusableCellWithIdentifier(Storyboard.urlsCellReuseIdentifier, forIndexPath: indexPath) as URLsTableViewCell
                        urlCell.tweet = mentions
                        println("returned URL")
                        return urlCell
                    case "Images":
                        let imageCell = tableView.dequeueReusableCellWithIdentifier(Storyboard.imagesCellReuseIdentifier, forIndexPath: indexPath) as ImagesTableViewCell
                        imageCell.tweet = mentions
                        return imageCell
                default: break
                }
            }
        }
        
        placeMentionItemsInStack()
        
        let emptyCell = tableView.dequeueReusableCellWithIdentifier(Storyboard.emptyCellReuseIdentifier, forIndexPath: indexPath) as EmptyTableViewCell

        println("Printed empty cell at section:" + "\(indexPath.section)")
        return emptyCell // arbitrary return statement
    }
    
//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return nil
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
