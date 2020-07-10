//
//  foodRecord.swift
//  Lab3
//
//  Created by jtpeter7 on 2/13/20.
//  Copyright © 2020 jtpeter7. All rights reserved.
//

import Foundation
class foodRecord
{
    var food:String? = nil
    var place:String? = nil
    var price:Double? = nil
    var number:Int? = nil
    
    init(n:String, s:String, a:Double, number:Int) {
        self.food = n
        self.place = s
        self.price = a
        self.number = number
    }
    
    func change_place(newPlace:String)
    {
        self.place = newPlace;
    }
    
    func change_price(newPrice:Double)
    {
        self.price = newPrice;
    }
}

