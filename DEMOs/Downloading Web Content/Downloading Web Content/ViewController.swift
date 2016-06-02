//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by WangHaixin on 9/21/15.
//  Copyright © 2015 WangHaixin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    func displayURL(){
        let myUrlString = "http://stackoverflow.com"
        let myUrl = NSURL(string: myUrlString)
        let myUrlTask =  NSURLSession.sharedSession().dataTaskWithURL(myUrl!)
            {   //<#T##(NSData?, NSURLResponse?, NSError?) -> Void#>
               
                (data , response ,error) in
                if error == nil {
                    let urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding)
                        print(urlContent)
                    
                    
                        //for queue priority
                    
                    dispatch_async(dispatch_get_main_queue()){
                        self.webView.loadHTMLString(urlContent! as String, baseURL: nil)
                    }
                }// if no error
            }//myUrlTask
         myUrlTask.resume()
    }
  
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        displayURL()
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

