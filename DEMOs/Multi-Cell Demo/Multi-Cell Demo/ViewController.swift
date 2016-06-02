//
//  ViewController.swift
//  Multi-Cell Demo
//
//  Created by WangHaixin on 12/2/15.
//  Copyright © 2015 WangHaixin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate
{
    // variable ---------
    @IBOutlet weak var tableView: UITableView!
    var list = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"]
    var list2 = ["new data1","new data2"]
   
    var tableVC = UITableViewController()
    var spinnerH = UIRefreshControl()
    var spinnerF: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)

   
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        tableVC.tableView = self.tableView
       
        tableView.delegate = self
        tableView.dataSource = self
       
        //footer   -------
        spinnerF.startAnimating()
        spinnerF.color = UIColor(red: 22.0/255.0, green: 106.0/255.0, blue: 176.0/255.0, alpha: 1.0)
        spinnerF.frame = CGRectMake(0, 0, 320, 44)
        self.tableView.tableFooterView = spinnerF
        
        // header
        
        tableVC.refreshControl = self.spinnerH
        self.spinnerH.addTarget(self, action: "didRefreshList", forControlEvents: UIControlEvents.ValueChanged)
        
        
    }

   // header
    func didRefreshList()
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let dateInFormat = dateFormatter.stringFromDate(NSDate())
        
        self.tableVC.tableView.reloadData()
        self.spinnerH.attributedTitle = NSAttributedString(string: "Lasted updated on \(dateInFormat)")
        self.spinnerH.endRefreshing()
    }
  

    func loadMoreStories()
    {
        self.list = self.list + self.list2
        print("doing here")
        self.tableView.reloadData()
    }
    
    
     func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
     {
        if indexPath.row == self.list.count-1
        {
            self.loadMoreStories()
        }
    }
    /*
    tableview default function
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("regularCell") as! regularCell
        cell.configureCell(list[indexPath.row])
        return cell
 
    }
    
    /*
    tableview default function
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    /*
    tableview default function
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return list.count
    }
    

}

