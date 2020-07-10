
import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // object instance of fruits object that has an array of fruits
    // and the section headers for the fruit table
    
    var myFruitModel:fruits =  fruits()
    @IBOutlet weak var fruitTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //create a dictionary with section headers as a kay and fruit object as a value
        myFruitModel.createFoodDictionary()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       // get the section count
        return myFruitModel.fruitSectionTitles.count
    }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
       // get the section title
       let fruitKey = myFruitModel.fruitSectionTitles[section]
    
       // use the section title to count howmany fruits are in that se
      if let count = myFruitModel.getSectionCount(key: fruitKey)
      {
        return count
       }else
      {
        return 0;
      }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // returns the heading for each section
        return myFruitModel.fruitSectionTitles[section]
    }
    
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fruitCell", for: indexPath) as! FruitTableViewCell
        // get the section key
         let fruitKey = myFruitModel.fruitSectionTitles[indexPath.section]
        if let fruit = myFruitModel.getFruitObjectforRow(key:fruitKey, index:indexPath.row)
        {
            cell.fruitTitle.text = fruit.fruitName;
            cell.fruitDescription.text = fruit.fruitDescription;
            cell.fruitImage.image = UIImage(named: fruit.fruitImageName)
        }
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedIndex: IndexPath = self.fruitTable.indexPath(for: sender as! UITableViewCell)!
        // access the section for the selected row
        let fruitKey = myFruitModel.fruitSectionTitles[selectedIndex.section]
     
        // get the fruit object for the selected row in the section
        let fruit = myFruitModel.getFruitObjectforRow(key:fruitKey, index:selectedIndex.row)
        
        if(segue.identifier == "detailView"){
            if let viewController: DetailViewController = segue.destination as? DetailViewController {
                viewController.selectedCity = fruit?.fruitName;
                viewController.selectedDescription = fruit?.fruitDescription;
                viewController.selectedImage = fruit?.fruitImageName;
            }
        }
    }
    
    
    
    @IBAction func addFruit(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add City", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter Name of the City Here"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            // Do this first, then use method 1 or method 2
            if let name = alert.textFields?.first?.text {
                print("Your name: \(name)")
                
                self.myFruitModel.addFruit(f_name: name, f_des: "New City on the Block", f_image: "banana.jpg")
            
                self.fruitTable.reloadData()
            }
        }))
        
        self.present(alert, animated: true)
    
    }
    


}

