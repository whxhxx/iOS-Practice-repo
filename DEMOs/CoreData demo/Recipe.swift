//
//  Recipe.swift
//  CoreData demo
//
//  Created by WangHaixin on 12/1/15.
//
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject
{
    func setRecipeImage(img: UIImage)
    {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getRecipeImg() -> UIImage
    {
        let img = UIImage(data: self.image!)!
        return img
    }

    
}
