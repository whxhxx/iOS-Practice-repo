//
//  TVC1.swift
//  ParseStarterProject-Swift
//
//  Created by WangHaixin on 1/8/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse


class TVC1: UITableViewController
{
    var usernameList = [""]
    var useridsList = [""]
    var isFollowing = ["":false]
    var refresher: UIRefreshControl!
    
    func refresh()
    {
        
        let query = PFUser.query()
        query?.findObjectsInBackgroundWithBlock(
            { (objects, error) -> Void in
                if let users = objects
                {
                    // remove original emptys
                    self.usernameList.removeAll(keepCapacity: true)
                    self.useridsList.removeAll(keepCapacity: true)
                    self.isFollowing.removeAll(keepCapacity: true)
                    
                    for object in users
                    {
                        if let user = object as? PFUser
                        {
                            self.usernameList.append(user.username!)
                            self.useridsList.append(user.objectId!)
                            
                            
                            let query = PFQuery(className: "followers")
//                            query.whereKey("follower", equalTo: (PFUser.currentUser()?.objectId)!)
//                            query.whereKey("following", equalTo: user.objectId!)
                            
                            query.findObjectsInBackgroundWithBlock(
                                { (objects, error) -> Void in
                                    if let objects = objects
                                    {
                                        if objects.count > 0
                                        {
                                            self.isFollowing[user.objectId!] = true
                                            
                                            
                                        }
                                        else
                                        {
                                            self.isFollowing[user.objectId!] = false
                                        }
                                    }
                                    if self.isFollowing.count == self.usernameList.count
                                    {
                                        self.tableView.reloadData()
                                        self.refresher.endRefreshing()
                                        
                                    }
                            })
                        }
                    }
                    
                }
            })
    }
    
        

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "pull to refresh")
        refresher.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refresher)
        
        refresh()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return usernameList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

         cell.textLabel?.text = usernameList[indexPath.row]
        
        let followedObjectId = useridsList[indexPath.row]
        if isFollowing[followedObjectId] == true
        {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        let followedObjectId = useridsList[indexPath.row]
        
        if isFollowing[followedObjectId] == false
        {
            isFollowing[followedObjectId] = true
            
        
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        
        
            let following = PFObject(className: "followers")
            following["following"] = useridsList[indexPath.row]  //
            following["follower"] = PFUser.currentUser()?.objectId //user himself
        
            following.saveInBackground()
        }
        else
        {
            isFollowing[followedObjectId] = true
            cell.accessoryType = UITableViewCellAccessoryType.None
         
            let query = PFQuery(className: "followers")
            query.whereKey("follower", equalTo: (PFUser.currentUser()?.objectId)!)
            query.whereKey("following", equalTo: useridsList[indexPath.row])
            
            query.findObjectsInBackgroundWithBlock(
                { (objects, error) -> Void in
                    if let objects = objects
                    {
                        for object in objects
                        {
                            object.deleteInBackground()
                        }
                    }
                    
                })
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
