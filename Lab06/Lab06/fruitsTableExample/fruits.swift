//
//  fruits.swift
//  fruitsTableExample
//
//  Created by user on 9/15/16.
//  Copyright © 2016 ASU. All rights reserved.
//

import Foundation

class fruits
{
    var fruits:[fruit] = []
    var fruitList = [String: [fruit]]()
    let fruitSectionTitles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    init()
    {
        let f1 = fruit(fn: "France", fd: "The Frenchiest Fries on Earth", fin: "France.jpeg")
        let f2 = fruit(fn: "St. Louis", fd: "Like a really tall arch", fin: "St.Louis.jpeg")
        let f3 = fruit(fn: "Chicago", fd: "Look at that BEAN", fin: "Chicago.jpeg")
        let f4 = fruit(fn: "Beijing", fd: "sorta crowded, aye?", fin: "Beijing.jpeg")
        let f5 = fruit(fn: "Tempe", fd: "the roads are always under construction", fin: "Tempe.jpeg")
        
        fruits.append(f1)
        fruits.append(f2)
        fruits.append(f3)
        fruits.append(f4)
        fruits.append(f5)
        
        
    }
    
    func createFoodDictionary() {
           // for each fruit in the fruit list from the fruits object
           for fruit in fruits {
             
               // extract the first letter as a string for the key
               let fName = fruit.fruitName
               
               let endIndex = fName.index((fName.startIndex), offsetBy: 1)
               
               let fruitKey = String(fName[(..<endIndex)])
               
               // build the fruit object array for each key
                if var fruitObjects = fruitList[fruitKey] {
                fruitObjects.append(fruit)
                fruitList[fruitKey] = fruitObjects
                
                } else {
                fruitList[fruitKey] = [fruit]
                }
    
           }
    }
    
    func getSectionCount(key : String) -> Int?
    {
        return fruitList[key]?.count
    }
    
    func getFruitObjectforRow(key:String, index: Int) -> fruit?
    {
        if let fruitValues = fruitList[key]{
           return fruitValues[index];
        }else
        {
            return nil
        }
        
    }
    
    func addFruit(f_name: String, f_des: String, f_image: String)
    {
        let newFruit = fruit(fn: f_name, fd: f_des, fin: f_image)
        self.fruits.append(newFruit)
        
            let fName = f_name
            
            let endIndex = fName.index((fName.startIndex), offsetBy: 1)
            
            let fruitKey = String(fName[(..<endIndex)])
            
            // adding the new fruit object to hthe dictionary
            if var fruitObjects = self.fruitList[fruitKey] {
                fruitObjects.append(newFruit)
                self.fruitList[fruitKey] = fruitObjects
                
            } else {
                self.fruitList[fruitKey] = [newFruit]
            }
        
        }
    
    
}
class fruit
{
    var fruitName:String
    var fruitDescription:String
    var fruitImageName:String
    
    init(fn:String, fd:String, fin:String)
    {
        fruitName = fn
        fruitDescription = fd
        fruitImageName = fin
        
    }
    
    
}
