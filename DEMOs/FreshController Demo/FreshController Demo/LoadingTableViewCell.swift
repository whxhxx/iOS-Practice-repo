//
//  LoadingTableViewCell.swift
//  FreshController Demo
//
//  Created by WangHaixin on 12/2/15.
//  Copyright © 2015 GMBP. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {
    
//    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.loadingIndicator.startAnimating()
    }
    
    func startAnimating() {
        self.loadingIndicator.startAnimating()
    }
    
    func stopAnimating() {
        self.loadingIndicator.stopAnimating()
    }
    
}
