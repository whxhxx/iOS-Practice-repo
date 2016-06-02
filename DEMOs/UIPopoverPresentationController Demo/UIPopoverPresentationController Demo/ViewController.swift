//
//  ViewController.swift
//  UIPopoverPresentationController Demo
//
//  Created by WangHaixin on 12/7/15.
//  Copyright © 2015 WangHaixin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPopoverPresentationControllerDelegate {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBOutlet weak var theButton : UIButton!
    
    @IBAction func popover(sender: AnyObject) {
        
        self.performSegueWithIdentifier("showView", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "showView"
        {
            let vc = segue.destinationViewController
            
            
            
            vc.modalPresentationStyle = .Popover
            vc.preferredContentSize = CGSizeMake(300, 30)
            
            let controller = vc.popoverPresentationController
         

            if controller != nil
            {
                controller?.delegate = self
                controller?.permittedArrowDirections = .Up
                controller?.sourceView = self.view
                controller?.sourceRect = CGRectMake(UIScreen.mainScreen().bounds.width/2,100,0,0)
//                controller?.sourceView = sender
//                controller?.sourceRect = CGRect(x: self.x, y: self.y, width: 1, height: 1)
                
                
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }


}

