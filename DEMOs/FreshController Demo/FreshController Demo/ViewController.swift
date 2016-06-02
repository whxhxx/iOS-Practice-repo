//
//  ViewController.swift
//  FreshController Demo
//
//  Created by WangHaixin on 11/30/15.
//  Copyright © 2015 GMBP. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var bottomAI : UIActivityIndicatorView!
    let cellIndentifier = "Cell"
    let list = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17"];
    let list2 = ["4"]
    var tableData = [String]()
    var tableViewController = UITableViewController(style: .Plain)
    
    
    //*************
    var refreshController = UIRefreshControl()
   
    let threshold = -100.0 // threshold from bottom of tableView
    var isLoadingMore = false // flag
    

    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
 
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
        
        /*
         this is bottom refresh trigger !
        */
         if !isLoadingMore && ( Double.init(maximumOffset - contentOffset) < threshold)
         {
 
            
            print(Double.init(maximumOffset - contentOffset))
            self.isLoadingMore = true
            
            // Update UI
            dispatch_async(dispatch_get_main_queue()) {
                self.tableViewController.tableView.reloadData()
                self.isLoadingMore = false
            }
        }
        
    }
    

    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        self.bottomAI.hidden = true
        tableData = list
        let tableView = tableViewController.tableView
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIndentifier)
        self.view.addSubview(tableView )
        tableView.dataSource = self
        tableView.delegate = self
        
        //************
        tableViewController.refreshControl = self.refreshController
        self.refreshController.addTarget(self, action: "didRefreshList", forControlEvents: UIControlEvents.ValueChanged)


    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      
            return tableData.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifier)! as UITableViewCell
        cell.textLabel!.text = tableData[indexPath.row]
        return cell
    }
    
    //**************
    func didRefreshList()
    {
         let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let dateInFormat = dateFormatter.stringFromDate(NSDate())
        
        self.tableViewController.tableView.reloadData()
        self.refreshController.attributedTitle = NSAttributedString(string: "Lasted updated on \(dateInFormat)")

        self.refreshController.endRefreshing()
    }


}

