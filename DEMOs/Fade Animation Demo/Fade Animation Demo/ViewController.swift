//
//  ViewController.swift
//  Fade Animation Demo
//
//  Created by WangHaixin on 12/22/15.
//  Copyright © 2015 WangHaixin. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.alpha = 0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startFade(sender: UIButton)
    {
        UIView.animateWithDuration(2)
        { () -> Void in
            self.titleLabel.alpha = 1
            self.titleLabel.alpha = 0
        }
    }

}

