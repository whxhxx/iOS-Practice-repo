//
//  ViewController.swift
//  Switch Demo
//
//  Created by WangHaixin on 12/30/15.
//  Copyright © 2015 WangHaixin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var s1: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sChanged(sender: UISwitch)
    {
        if s1.on
        {
            print("on")
        }
        else
        {
            print("off")
        }
    }

}

