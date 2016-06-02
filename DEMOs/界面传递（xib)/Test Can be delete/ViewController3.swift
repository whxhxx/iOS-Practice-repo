//
//  ViewController3.swift
//  Test Can be delete
//
//  Created by WangHaixin on 16/4/22.
//  Copyright © 2016年 WangHaixin. All rights reserved.
//

import UIKit

class ViewController3: UIViewController
{
    var content = ""

    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.myLabel.text = self.content
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBack(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
