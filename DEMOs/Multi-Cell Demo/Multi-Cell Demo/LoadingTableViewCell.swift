//
//  LoadingTableViewCell.swift
//  Multi-Cell Demo
//
//  Created by WangHaixin on 12/2/15.
//  Copyright © 2015 WangHaixin. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {

    //variable ------
    @IBOutlet weak var myActivityIndicator : UIActivityIndicatorView!
    
    //v √      ------
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myActivityIndicator.startAnimating()
    }
    
    func startAnimating() {
        self.myActivityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        self.myActivityIndicator.stopAnimating()
    }

}
