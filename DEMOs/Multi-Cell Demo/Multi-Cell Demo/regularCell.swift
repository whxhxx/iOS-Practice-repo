//
//  regularCell.swift
//  Multi-Cell Demo
//
//  Created by WangHaixin on 12/2/15.
//  Copyright © 2015 WangHaixin. All rights reserved.
//

import UIKit

class regularCell: UITableViewCell {
    
    @IBOutlet weak var myLabel: UILabel!

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(label:String)
    {
         myLabel.text = label
    }

}
