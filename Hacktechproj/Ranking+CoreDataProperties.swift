//
//  Ranking+CoreDataProperties.swift
//  
//
//  Created by Mohit on 03/03/19.
//
//

import Foundation
import CoreData


extension Ranking {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ranking> {
        return NSFetchRequest<Ranking>(entityName: "Ranking")
    }

    @NSManaged public var name: String?
    @NSManaged public var score: String?

}
