//
//  ViewController.swift
//  Test Can be delete
//
//  Created by WangHaixin on 16/4/22.
//  Copyright © 2016年 WangHaixin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func btnPressed(sender: AnyObject)
    {
        
        let vc = ViewController3(nibName: "ViewController3", bundle: nil)
        
        if  textField.text != nil
        {
            vc.content = textField.text!
        }
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

