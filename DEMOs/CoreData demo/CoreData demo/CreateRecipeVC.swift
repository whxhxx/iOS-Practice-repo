//
//  CreateRecipeVC.swift
//  CoreData demo
//
//  Created by WangHaixin on 12/2/15.
//
//
import CoreData
import UIKit

class CreateRecipeVC: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{

    //variable-----
    @IBOutlet weak var rTitle:UITextField!
    @IBOutlet weak var rIngredients:UITextField!
    @IBOutlet weak var rSteps: UITextField!
    @IBOutlet weak var rImage: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    
    
    var imagePicker: UIImagePickerController!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        addButton.hidden = false
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        rImage.layer.cornerRadius = 4.0
        rImage.clipsToBounds = true
        
    }
    //keyboard 
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    //keyboard √
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage theImage: UIImage, editingInfo: [String : AnyObject]?)
    {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        rImage.image = theImage
        addButton.hidden = true
        
    }
    
    @IBAction func addImage(sender: AnyObject!)
    {
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    // func to save data into CORE DATA
    @IBAction func createRecipe(sender:AnyObject!)
    {
        if let theTitle = rTitle.text where theTitle != ""
        {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            
            let theEntity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            
            let recipeToDB = Recipe(entity: theEntity, insertIntoManagedObjectContext: context)
            
            recipeToDB.title = theTitle
            recipeToDB.ingredients = rIngredients.text
            recipeToDB.steps = rSteps.text
            recipeToDB.setRecipeImage(rImage.image!)
            
            context.insertObject(recipeToDB)
            do
            {
                try context.save()
            }
            catch
            {
                print("Could not save Recipe")
            }
            
//            dismissViewControllerAnimated(true, completion: nil)
            self.navigationController?.popViewControllerAnimated(true)
            
        }
    }


}
