//
//  ViewImage1.swift
//  TouchAndDisappear Demo
//
//  Created by WangHaixin on 12/28/15.
//  Copyright © 2015 WangHaixin. All rights reserved.
//


import Foundation
import UIKit

class ViewImage1 : UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var scrollView: UIScrollView!
    var img : UIImage?
    var imageView = UIImageView()
    var button = UIButton()
  
    
 
    
 
    
    override func viewDidLoad()
    {
       
    }
    
    func imgSetup()
    {
        imageView.image = img
        imageView.userInteractionEnabled = true
        
        imageView.contentMode = UIViewContentMode.Center
        
        imageView.frame = CGRectMake(0, 0, img!.size.width, img!.size.height)
        
        self.scrollView.addSubview(imageView)
        
        scrollView.contentSize = img!.size
        
        let scrollViewFrame = scrollView.frame
        
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        
        let minScale = min(scaleHeight,scaleWidth)
        
        scrollView.minimumZoomScale = minScale
        
        scrollView.maximumZoomScale = 3
        
        scrollView.zoomScale = minScale
        
        centerScrollViewContents()
        
    }
    
    //runs when the view appears
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        scrollView.delegate = self
        
        self.img = UIImage(named: "e")
        button.setBackgroundImage(img, forState: UIControlState.Normal)
        
        self.imageView.image = img
        self.scrollView.addSubview(imageView)
        
        
    }
    
    
    
    func centerScrollViewContents()
    {
        let boundsSize = scrollView.bounds.size
        var contentsFrame = imageView.frame
        if contentsFrame.size.width < boundsSize.width
        {
            contentsFrame.origin.x = ( boundsSize.width - contentsFrame.size.width) / 2
            
        }
        else
        {
            contentsFrame.origin.x = 0
        }
        
        if contentsFrame.size.height < boundsSize.height
        {
            contentsFrame.origin.y = ( boundsSize.height - contentsFrame.size.height) / 2
            
        }
        else
        {
            contentsFrame.origin.y = 0
        }
        
        imageView.frame = contentsFrame
        
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView)
    {
        centerScrollViewContents()
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return imageView
    }
    
    
    
    
    
    
    
    
    
    
    
}