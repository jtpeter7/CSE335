//
//  fruitModel.swift
//  tableViewIntroduction
//
//  Created by user on 9/14/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class fruitModel
{
    var data = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                "Clementine", "Coconut", "Cranberry", "Fig"]
    
    
    func getCount() -> Int
    {
        return data.count
    }
    
    func getFruitName(loc: Int) -> String
    {
        
        return data[loc]
    }
    
    func addFruit(fruit:String)
    {
        data += [fruit]
    }
    
    func removeFruit(index: Int)
    {
        data.remove(at: index)
    }
    
    
}
