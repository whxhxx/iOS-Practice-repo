/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController
{
 
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    
    
    func displayAlert(title:String , message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler:
            { (action) -> Void in
                alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)

    }
    
    @IBAction func signUp(sender: UIButton)
    {
        if username.text == "" || password.text == ""
        {
            displayAlert("Error", message: "Please enter a username and password")
        }
        else
        {
           activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0,50,50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
            let user = PFUser()
            user.username = username.text
            user.password = password.text
            
            var errorMessage = "Please try again later"
            
            user.signUpInBackgroundWithBlock(
            {
                (success, error) -> Void in
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if error == nil
                {
                    // SignUp successful
                    self.displayAlert("Sign Up Successful", message: "")
                }
                else
                {
                    if let errorString = error!.userInfo["error"] as? String
                    {
                        errorMessage = errorString
                    }
                    self.displayAlert("Failed SignUp", message: errorMessage)
                }
            })
        }
        
    }
    
    @IBAction func logIn(sender: UIButton)
    {
      var errorMessage = ""
        
        PFUser.logInWithUsernameInBackground( username.text!, password: password.text!)
            { (user, error) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if user != nil
                {
                    // login in
                    self.performSegueWithIdentifier("login", sender: self)
                }
                else
                {
                    if let errorString = error!.userInfo["error"] as? String
                    {
                        errorMessage = errorString
                    }
                    self.displayAlert("Login Failed", message: errorMessage )
                }
        }
        
    
    }
    
    override func viewDidAppear(animated: Bool)
    {
        if PFUser.currentUser() != nil
        {
            print(PFUser.currentUser()!.objectId!)
            self.performSegueWithIdentifier("login", sender: self)
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
