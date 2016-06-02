//
//  PostImageVC.swift
//  ParseStarterProject-Swift
//
//  Created by WangHaixin on 1/15/16.
//  Copyright © 2016 Parse. All rights reserved.
//
import Parse
import UIKit

class PostImageVC: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate, UIPickerViewDelegate
{
    var activityIndicator = UIActivityIndicatorView()
    @IBOutlet weak var imageToPost: UIImageView!
    @IBOutlet weak var message: UITextField!
 
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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func chooseImage(sender: UIButton)
    {
        let image = UIImagePickerController()
      
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?)
    {
        print("picker")
        self.dismissViewControllerAnimated(true, completion: nil)
        imageToPost.image = image
    }

    @IBAction func postImage(sender: UIButton)
    {
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0,50,50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        
        let post = PFObject(className: "Post")
        post["message"] = message.text
        post["userId"] = PFUser.currentUser()!.objectId!
        
        let imageData = UIImagePNGRepresentation(imageToPost.image!)
        let imageFile = PFFile(name: "image.png", data: imageData!)
        post["imageFile"] = imageFile
        post.saveInBackgroundWithBlock
            { (success, error) -> Void in
                self.activityIndicator.stopAnimating()
                if error == nil
                {
                    print("UPLOAD DONE")
                }
            }
        
        
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
