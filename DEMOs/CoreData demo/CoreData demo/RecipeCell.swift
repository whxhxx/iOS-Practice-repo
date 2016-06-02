//
//  RecipeCell.swift
//  CoreData demo
//
//  Created by WangHaixin on 12/2/15.
//
//

import UIKit

class RecipeCell: UITableViewCell
{
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    
    
    // variable ends ----------   -----------   ------------   ------------
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(theRecipe: Recipe)
    {
        recipeTitle.text = theRecipe.title
        recipeImg.image = theRecipe.getRecipeImg()
         
    }
  

}
