//
//  GetImageVC.swift
//  ParseStarterProject-Swift
//
//  Created by WangHaixin on 1/15/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class GetImageVC: UIViewController
{
    var imageFiles = [PFFile]()

    @IBOutlet weak var imageView: UIImageView!
    
    var count = 0
    var start = 0
    
    @IBAction func getImage(sender: UIButton)
    {
        imageFiles.removeAll(keepCapacity: true)
        
        let query = PFQuery(className: "Post")
       
        query.findObjectsInBackgroundWithBlock
            { (objects, error) -> Void in
                if let objects = objects
                {
                    for object in objects
                    {
                        self.imageFiles.append(object["imageFile"] as! PFFile)
                    }
                }
                
                self.count = self.imageFiles.count
                
                self.imageFiles[self.start].getDataInBackgroundWithBlock
                    { (data, error) -> Void in
                        if let downloadImage = UIImage(data: data!)
                        {
                            self.imageView.image = downloadImage
                        }
                    }
                if(self.start + 1 < self.count)
                {
                    self.start++
                }
                else
                {
                    self.start--
                }
                
            }
       
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
