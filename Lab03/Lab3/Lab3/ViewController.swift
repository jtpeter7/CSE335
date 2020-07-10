//
//  ViewController.swift
//  Lab3
//
//  Created by jtpeter7 on 2/13/20.
//  Copyright © 2020 jtpeter7. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var Food: UITextField!
    @IBOutlet weak var Place: UITextField!
    @IBOutlet weak var Price: UITextField!
    @IBOutlet weak var searchedFood: UITextField!
    @IBOutlet weak var searchedPlace: UITextField!
    @IBOutlet weak var searchedPrice: UITextField!
    @IBOutlet weak var prompt: UILabel!
    
    var currentKey:Int = 0;
    var foodDictionary:infoDictionary = infoDictionary()
    @IBAction func DeleteFood(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Remove Food", message: "", preferredStyle: .alert)
        
        let searchAction = UIAlertAction(title: "Remove", style: .default) { (aciton) in
            
            let text = alertController.textFields!.first!.text!
            
            if !text.isEmpty {
                let food = String(text)
                self.foodDictionary.deleteRec(s: food)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "enter food here"
            textField.keyboardType = .decimalPad
        }
        alertController.addAction(searchAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        searchedFood.text="";
        searchedPlace.text=""
        searchedPrice.text=""
    }
    
    @IBAction func Search(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Search Record", message: "", preferredStyle: .alert)
        
        let searchAction = UIAlertAction(title: "Search", style: .default) { (aciton) in
            
            let text = alertController.textFields!.first!.text!
            
            if !text.isEmpty {
                let food = String(text)
                let p =  self.foodDictionary.search(s: food)
                if let x = p {
                    self.searchedFood.text = x.food!
                    self.searchedPlace.text = x.place!
                    self.searchedPrice.text = String(format: "%.2f", x.price!)
                }
                
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "enter food here"
            textField.keyboardType = .decimalPad
        }
        alertController.addAction(searchAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func addFood(_ sender: UIBarButtonItem) {
        if let food = Food.text,
        let place = Place.text,
        let price = Double(Price.text!){
            foodDictionary.add(food,place,price)
            self.Food.text = "";
            self.Place.text = "";
            self.Price.text = "";
        }else{
            let alert = UIAlertController(title: "Data Input Error", message: "Data Inputs are either empty or incorrect types", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func Edit(_ sender: Any) {
        let alertController = UIAlertController(title: "Edit Record", message: "", preferredStyle: .alert)
        
        let searchAction = UIAlertAction(title: "Edit", style: .default) { (aciton) in
            
            let text = alertController.textFields!.first!.text!
            let text2 = alertController.textFields![1].text!
            let text3 = alertController.textFields![2].text!
            
            if !text.isEmpty {
                let food = String(text)
                let p =  self.foodDictionary.search(s: food)
                if !text2.isEmpty{
                    self.foodDictionary.changePlace(s: food, b: text2)
                }
                if !text3.isEmpty{
                    let z = Double(text3)!
                    //let q = z as! Double
                    self.foodDictionary.changePrice(s: food, b: z)
                }
                if let x = p {
                    self.searchedFood.text = x.food!
                    self.searchedPlace.text = x.place!
                    self.searchedPrice.text = String(format: "%.2f", x.price!)
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "enter food here"
            textField.keyboardType = .decimalPad
        }
        alertController.addTextField { (textField2) in
            textField2.placeholder = "enter place here"
            textField2.keyboardType = .decimalPad
        }
        alertController.addTextField { (textField3) in
            textField3.placeholder = "enter price here"
            textField3.keyboardType = .decimalPad
        }
        alertController.addAction(searchAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func Next(_ sender: Any) {
        prompt.text = "No more Records"
        var lastkey:Int = 999999;
        var nextKey:Int?
        if searchedFood.text == ""{
            for food in foodDictionary.infoRepository{
                if(food.value.number! < lastkey){
                    searchedFood.text = food.key
                    searchedPlace.text = food.value.place;
                    searchedPrice.text = String(format: "%.2f", food.value.price!);
                    lastkey = food.value.number!;
                    prompt.text = ""
                }
            }
        }else{
            let p =  self.foodDictionary.search(s: searchedFood.text!)
            nextKey = p?.number;
            for food in foodDictionary.infoRepository{
                if(food.value.number! < lastkey && food.value.number! > nextKey!){
                    searchedFood.text = food.key;
                    searchedPlace.text = food.value.place;
                    searchedPrice.text = String(format: "%.2f", food.value.price!);
                    lastkey = food.value.number!
                    prompt.text = ""
                }
            }
        }
    }
    
    @IBAction func Previous(_ sender: Any) {
        prompt.text = "Showing First Record"
        var currentKey:Int = -1;
        var nextKey:Int?
        let p =  self.foodDictionary.search(s: searchedFood.text!)
        nextKey = p?.number;
        for food in foodDictionary.infoRepository{
            if(food.value.number! > currentKey && food.value.number! < nextKey!){
                searchedFood.text = food.key;
                searchedPlace.text = food.value.place;
                searchedPrice.text = String(format: "%.2f", food.value.price!);
                currentKey = food.value.number!
                prompt.text = ""
            }
        }
    }
    
    
    
}

