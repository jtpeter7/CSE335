//
//  FruitEntity+CoreDataProperties.swift
//  tableViewCoreData
//
//  Created by user on 10/1/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation
import CoreData


extension FruitEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FruitEntity> {
        return NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var details: String?
    @NSManaged public var picture: NSData?

}
