//
//  infoDictionary.swift
//  Lab3
//
//  Created by jtpeter7 on 2/13/20.
//  Copyright © 2020 jtpeter7. All rights reserved.
//

import Foundation
class infoDictionary
{
    // dictionary that stores person records
    var infoRepository : [String:foodRecord] = [String:foodRecord] ()
    var z=0;
    init() { }
    func add(_ food:String, _ place:String, _ price:Double)
    {
        let pRecord =  foodRecord(n: food, s:place, a: price, number: z)
        infoRepository[pRecord.food!] = pRecord
        z+=1;
    }
    
    
    func search(s:String) -> foodRecord?
    {
        var found = false
        for (food, _) in infoRepository
        {
            if food == s {
                found = true
                break
            }
        }
        if found
        {
            return infoRepository[s]
        }else  {
            return nil
        }
    }
    
    func deleteRec(s:String)
    {
        var found=false;
        for (food, _) in infoRepository{
            if food == s{
                found=true;
            }
        }
        if found{
            infoRepository[s] = nil
        }
    }
    
    func changePlace(s:String, b:String)
    {
        var found=false;
        for (food, _) in infoRepository{
            if food == s{
                found=true;
            }
        }
        if found{
            infoRepository[s]?.change_place(newPlace: b)
        }
    }
    func changePrice(s:String, b:Double)
    {
        var found=false;
        for (food, _) in infoRepository{
            if food == s{
                found=true;
            }
        }
        if found{
            infoRepository[s]?.change_price(newPrice: b)
        }
    }
}
