//
//  Cell.swift
//  FreshController Demo
//
//  Created by WangHaixin on 12/1/15.
//  Copyright © 2015 GMBP. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var  myLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
