//
//  ViewController.swift
//  tableViewCoreData
//
//  Created by user on 10/1/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var fruitTable: UITableView!
//    var selectedImage:UIImage?
    var counter = 1
    
    // handler to the managege object context
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //this is the array to store Fruit entities from the coredata
    var   fetchResults =   [FruitEntity]()
    
    func fetchRecord() -> Int {
        // Create a new fetch request using the FruitEntity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FruitEntity")
        let sort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        var x   = 0
        // Execute the fetch request, and cast the results to an array of FruitEnity objects
        fetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [FruitEntity])!
        
        
        x = fetchResults.count
        
        print(x)
        
        // return howmany entities in the coreData
        return x
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        initCounter()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // number of rows based on the coredata storage
        return fetchRecord()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // add each row from coredata fetch results
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) 
        cell.layer.borderWidth = 1.0
        cell.textLabel?.text = fetchResults[indexPath.row].name
        cell.detailTextLabel?.text = fetchResults[indexPath.row].details
        
        if let picture = fetchResults[indexPath.row].picture {
            cell.imageView?.image =  UIImage(data: picture  as Data)
        } else {
            cell.imageView?.image = nil
        }
        
        return cell
    }
    
    // delete table entry
    // this method makes each row editable
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    // return the table view style as deletable
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell.EditingStyle { return UITableViewCell.EditingStyle.delete }
    
    
    // implement delete function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        
        if editingStyle == .delete
        {
            
            // delete the selected object from the managed
            // object context
            managedObjectContext.delete(fetchResults[indexPath.row])
            // remove it from the fetch results array
            fetchResults.remove(at:indexPath.row)
            
            do {
                // save the updated managed object context
                try managedObjectContext.save()
            } catch {
                
            }
            // reload the table after deleting a row
            fruitTable.reloadData()
        }
        
    }
    
    @IBAction func addARecord(_ sender: UIBarButtonItem) {
        
        // create a new entity object
        let ent = NSEntityDescription.entity(forEntityName: "FruitEntity", in: self.managedObjectContext)
        //add to the manege object context
        let newItem = FruitEntity(entity: ent!, insertInto: self.managedObjectContext)
        //newItem.name = "Banana \(counter)"
        //newItem.details = "Good for health"
        newItem.picture = nil
        
        // one more item added
        updateCounter()
        
        
        
        // show the alert controller to select an image for the row
        let alertController = UIAlertController(title: "Add City", message: "", preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter Name of the City Here"
        })
        
        alertController.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter Description Here"
        })
        
        let serachAction = UIAlertAction(title: "Picture", style: .default) { (aciton) in
            // load image
            newItem.name = alertController.textFields?.first?.text;
            newItem.details = alertController.textFields?.last?.text;
            let photoPicker = UIImagePickerController ()
            photoPicker.delegate = self
            photoPicker.sourceType = .photoLibrary
            // display image selection view
            self.present(photoPicker, animated: true, completion: nil)
            self.fruitTable.reloadData()
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        alertController.addAction(serachAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
        
        

        
        // save the updated context
        do {
            try self.managedObjectContext.save()
        } catch _ {
        }
        
        
        //print(newItem)
        // reload the table with added row
        // this happens before getting the image, so first we add the row
        // without the image and then add the image
        fruitTable.reloadData()
    }
    
    func updateLastRow() {
        let indexPath = IndexPath(row: fetchResults.count - 1, section: 0)
        fruitTable.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
    func initCounter() {
        counter = UserDefaults.init().integer(forKey: "counter")
    }
    
    func updateCounter() {
        counter += 1
        UserDefaults.init().set(counter, forKey: "counter")
        UserDefaults.init().synchronize()
    }
    
    
    @IBAction func deleteAll(_ sender: UIBarButtonItem) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FruitEntity")
        
        // whole fetchRequest object is removed from the managed object context
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try managedObjectContext.execute(deleteRequest)
            try managedObjectContext.save()
            
            
        }
        catch let _ as NSError {
            // Handle error
        }
        
        fruitTable.reloadData()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        picker .dismiss(animated: true, completion: nil)

        // fetch resultset has the recently added row without the image
        // this code ad the image to the row
        if let fruit = fetchResults.last, let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            fruit.picture = image.pngData()! as NSData
            //update the row with image
            updateLastRow()
            do {
                try managedObjectContext.save()
            } catch {
                print("Error while saving the new image")
            }
            
        }
        
    }
    
    
    func prepare(for segue: UIStoryboardSegue, sender: UITableViewCell?) {
        
        let selectedIndex: IndexPath = self.fruitTable.indexPath(for: sender as! UITableViewCell)!
        // access the section for the selected row
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FruitEntity")
        let sort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        fetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [FruitEntity])!
        let test = fetchResults[selectedIndex.count];
        
        // get the fruit object for the selected row in the section
        
        if(segue.identifier == "detailView"){
            if let viewController: DetailViewController = segue.destination as? DetailViewController {
                viewController.selectedImage = test.picture;
                viewController.selectedCity = test.name
                viewController.selectedDescription = test.details;
            }
        }
    }
}
