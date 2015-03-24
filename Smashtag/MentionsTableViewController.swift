//
//  MentionsTableViewController.swift
//  Smashtag
//
//  Created by Arnold Lam on 2015-03-22.
//  Copyright (c) 2015 Arnold Lam. All rights reserved.
//

import UIKit

class MentionsTableViewController: UITableViewController {

    var mentions: Tweet? // tweet
    
    private struct Storyboard {
        static let imagesCellReuseIdentifier = "imagesCell"
        static let urlsCellReuseIdentifier = "urlsCell"
        static let hashtagsCellResuseIdentifier = "hashtagsCell"
        static let usersCellReuseIdentifier = "userMentionsCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var numberOfSections: Int = 0
        
        if !mentions!.userMentions.isEmpty {
            numberOfSections++
        }
        if !mentions!.hashtags.isEmpty {
            numberOfSections++
        }
        if !mentions!.urls.isEmpty {
            numberOfSections++
        }
        if !mentions!.media.isEmpty {
            numberOfSections++
        }
        println("Number of sections=\(numberOfSections)")
        return numberOfSections
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.imagesCellReuseIdentifier, forIndexPath: indexPath) as ImagesTableViewCell
        cell.tweet = mentions
        
        switch indexPath.row {
        case 0:
            if mentions?.media != nil {
                let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.imagesCellReuseIdentifier, forIndexPath: indexPath) as ImagesTableViewCell
                cell.tweet = mentions
            }
        case 1:
            if mentions?.urls.description != nil {
                let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.urlsCellReuseIdentifier, forIndexPath: indexPath) as URLsTableViewCell
                cell.tweet = mentions
            }
        case 2:
            if mentions?.hashtags.description != nil {
                let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.hashtagsCellResuseIdentifier, forIndexPath: indexPath) as HashtagsTableViewCell
                cell.tweet = mentions
            }
        case 3:
            if mentions?.userMentions.description != nil {
                let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.usersCellReuseIdentifier, forIndexPath: indexPath) as UsersTableViewCell
                cell.tweet = mentions
            }
        default: break
        }
        return cell
    }

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
