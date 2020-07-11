//
//  ViewController.swift
//  tableViewIntroduction
//
//  Created by user on 9/13/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // UI outlet for the table
    @IBOutlet weak var fruitTable: UITableView!
    //reference to the model object where fruit data and related methods implemented
    var fruits:fruitModel = fruitModel()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // how many rows in the table. This method will also be
    //called while loading the app
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fruits.getCount()
    }
    
    // generate each row while loading the app
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = fruitTable.dequeueReusableCell(withIdentifier: "fruitCell", for: indexPath)
        
        cell.textLabel?.text = fruits.getFruitName(loc: indexPath.row)
        
        
        return cell;
    }
    
    // this method enables table rows to be deleted by swiping the row from right to left
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    //delete an entry
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            
            fruits.removeFruit(index: indexPath.row)
            fruitTable.reloadData()
        }
    }
    
    
    // go to the detail view through the segue. Then happens when the user select a table row
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndex: IndexPath = self.fruitTable.indexPath(for: sender as! UITableViewCell)!
        
        let name = fruits.getFruitName(loc: selectedIndex.row)
        
        
        
        if(segue.identifier == "detailView"){
            if let viewController: FruitViewController = segue.destination as? FruitViewController {
                viewController.selectedFruit = name;
            }
        }
    }

    
    // adding a new fruit. Cahnge the model and reload the table
    @IBAction func addFruits(_ sender: Any)
    {
        
        //data += ["Banana"]
        
        fruits.addFruit(fruit: "Banana")
        fruitTable.reloadData()
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue)
    {
        
        
    }


}

