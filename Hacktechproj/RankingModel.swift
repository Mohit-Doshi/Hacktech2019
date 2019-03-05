//
//  RankingModel.swift
//  Hacktechproj
//
//  Created by Mohit on 03/03/19.
//  Copyright © 2019 Mohit D. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class RankingModel
{
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var fetchResults = [Ranking]()
    
    init()
    {
        /* initialized tableview for a trial run
         let pic:UIImage = UIImage(named:"tempe-arizona.jpg")!
         addCity(name: "Tempe", description: "Home of ASU", picture: pic.pngData()!)
         addCity(name: "Bel Air", description: "Neighborhood in Los Angeles", picture: pic.pngData()!)
         addCity(name: "Peoria", description: "Phoenix Satellite", picture: pic.pngData()!)
         addCity(name: "Bangalore", description: "Tech, Startups,Traffic, Rain", picture: pic.pngData()!)
         addCity(name: "Tucson", description: "Meh", picture: pic.pngData()!)*/
        
    }
    
    func fetchRecord() -> Int {
        // Create a new fetch request using the CityEntity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Ranking")
        var x   = 0
        // Execute the fetch request, and cast the results to an array of FruitEnity objects
        fetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [Ranking])!
        
        print(fetchResults)
        
        x = fetchResults.count
        
        print(x)
        
        // return how many entities are present in the coreData
        return x
    }
    
    func addRanking(name:String, score:String)
    {
        // create a new entity object
        let ent = NSEntityDescription.entity(forEntityName: "Ranking", in: self.managedObjectContext)
        //add to the manege object context
        let newItem = Ranking(entity: ent!, insertInto: self.managedObjectContext)
        newItem.name = name
        newItem.score = score
        
        // save the updated context
        do {
            try self.managedObjectContext.save()
        } catch _ {
        }
        
        print(newItem)
    }
    
/*    func removeCity(row:Int)
    {
        managedObjectContext.delete(fetchResults[row])  // the core data deletion is happening here
        // remove it from the fetch results array
        fetchResults.remove(at:row)
        
        do {
            // save the updated managed object context
            try managedObjectContext.save()             // and here
        } catch {
            
        }
        
    }*/
    
    func getRankingObject(row:Int) -> Ranking
    {
        return fetchResults[row]
    }
}

