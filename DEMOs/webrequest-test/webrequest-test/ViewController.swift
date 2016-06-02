//
//  ViewController.swift
//  webrequest-test
//
//  Created by WangHaixin on 10/30/15.
//  Copyright © 2015 WangHaixin. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var string1 : String = "abc"
    @IBOutlet weak var label1: UILabel!
   
    @IBAction func button1(sender: UIButton) {
        label1.text = string1
    }

    override func viewDidLoad()
    {
        
        super.viewDidLoad()
//        let urlString = "http://swapi.co/api/people/1"
//        let url = NSURL(string: urlString)!
//        let session = NSURLSession.sharedSession()
        
        let id2 = UIDevice.currentDevice().identifierForVendor?.UUIDString
        string1 = id2!
//        session.dataTaskWithURL(url)
//        {
//            (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
//            if let responseData = data
//            {
//                do
//                {
//                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
//                    if let dict = json as? Dictionary<String, AnyObject>
//                    {
//                        if let name = dict["name"] as? String ,
//                           let height = dict["height"] as? String,
//                           let birth = dict["birth_year"] as? String,
//                           let hair = dict["hair_color"] as? String
//                            {
//                                let person = SWPerson(name: name, height: height, birthYear: birth, hairColor: hair)
//                                self.string1 = person.name
//                                
////                              print (person.name)
//                            }
//                        if let films = dict["films"] as? [String]
//                        {
//                            for film in films
//                            {
//                                print(film)
//                            }
//                        }
//                        
//                    }
//                   // print(json)
//                }
//                catch
//                {
//                    print("could not serialize")
//                }
//            }
//       
//        }.resume()
        
      
        
    }
    
 


}

