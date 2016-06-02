//
//  ViewController.swift
//  Storage Practice
//
//  Created by WangHaixin on 9/15/15.
//  Copyright (c) 2015 WangHaixin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        NSUserDefaults.standardUserDefaults().setObject("Rob", forKey: "name")
        
        var name =  NSUserDefaults.standardUserDefaults().objectForKey("name")! as! String
      
        println(name)
        
        var arr = [1,2, 3]
        NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "array")

        var recallArray =  NSUserDefaults.standardUserDefaults().objectForKey("array")! as! NSArray
        
        println(recallArray )
        println(recallArray[2])
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

