//
//  ViewController.swift
//  CoreData demo
//
//  Created by WangHaixin on 12/1/15.
//
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate
{

    // Variables     ------ -------- ------- --------- ------- --------- ------- --------
    @IBOutlet weak var tableView: UITableView!
   // not in use
    var fetchedResultsController: NSFetchedResultsController!
    
    var recipes = [Recipe]()
    
    // View functions ------ -------- ------- --------- ------- --------- ------- --------
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool)
    {
        fetchAndSetResults()
        tableView.reloadData()
    }

    
    /*
    function to fetch data from CD and save it into [Recipe]
    */
    func fetchAndSetResults()
    {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        //scratch pad
        let context = app.managedObjectContext
        // a entity fetch request
        let fetchRequest = NSFetchRequest(entityName: "Recipe")
        
        do
        {   //store in results
            let results = try context.executeFetchRequest(fetchRequest)
            self.recipes = results as! [Recipe]
        }
        catch let err as NSError
        {
            print(err.debugDescription)
        }
    }
    
    
    /*
      tableview default function
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell") as? RecipeCell
        {
            let recipe = recipes[indexPath.row]
            cell.configureCell(recipe)
            return cell
        }
        else
        {
            return RecipeCell()
        }
    }
    
    /*
    tableview default function
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    /*
    tableview default function
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return recipes.count
    }
    

}

