//
//  CoreLocation.swift
//  delegator
//
//  Created by Fred Pearson on 2015-01-31.
//  Copyright (c) 2015 Frederick Pearson. All rights reserved.
//

import Foundation
import CoreData

enum locationType : Int {
    case Main = 1
    case Other = 2
}

class CoreLocation: NSManagedObject {
    
    @NSManaged var address_line1: String
    @NSManaged var address_line2: String
    @NSManaged var city: String
    @NSManaged var country: String
    @NSManaged var zip: String
    @NSManaged var latitude: NSNumber
    @NSManaged var longitude: NSNumber
    @NSManaged var created_on: NSDate
    @NSManaged var updated_on: NSDate
    @NSManaged var location_type: NSNumber
    @NSManaged var user: CoreUser
    
    
    class func getMainLocationByUser(moc: NSManagedObjectContext) -> CoreLocation? {
        let fetchRequest = NSFetchRequest(entityName: "CoreLocation")
        
        let predicate = NSPredicate(format: "location_type == %@", true)
        fetchRequest.predicate = predicate
        
        var coreLocation : [CoreLocation]? = [CoreLocation]()
        
        var error : NSError? = nil
        if let fetchResults = moc.executeFetchRequest(fetchRequest, error: &error) as? [CoreLocation] {
            coreLocation = fetchResults
            if coreLocation?.count > 0 {
                return coreLocation?[0]
            }
            
        } else {
            println("\(error?.userInfo)")
        }
        
        return nil
    }
    
    class func removeCurrentMain(moc: NSManagedObjectContext) -> Bool {
        let cl = getMainLocationByUser(moc)
        cl?.location_type = locationType.Other.rawValue
        if moc.save(nil) {
            return true
        }
        return false
    }
    
    
    class func getAllUserLocations(moc: NSManagedObjectContext) -> [CoreLocation]? {
        let fetchRequest = NSFetchRequest(entityName: "CoreLocation")
        
        var cl : [CoreLocation] = [CoreLocation]()
        
        var error : NSError? = nil
        if let fetchResults = moc.executeFetchRequest(fetchRequest, error: &error) as? [CoreLocation] {
            cl = fetchResults
            return cl
        } else {
            println(error?.userInfo)
        }
        return nil
    }
    
    class func locationExists(moc: NSManagedObjectContext, latitude: NSNumber, longitude: NSNumber) -> CoreLocation? {
        
        let fetchRequest = NSFetchRequest(entityName: "CoreLocation")
        let predicateLat = NSPredicate(format: "latitude == %lf", latitude.floatValue)
        let predicateLong = NSPredicate(format: "longitude == %lf", longitude.floatValue)
        println(latitude)
        let compoundPredicate = NSCompoundPredicate(type: NSCompoundPredicateType.AndPredicateType, subpredicates: [predicateLat!, predicateLong!])
        fetchRequest.predicate = compoundPredicate
        
        var coreLocation : [CoreLocation] = [CoreLocation]()
        
        var error : NSError? = nil
        if let fetchResults = moc.executeFetchRequest(fetchRequest, error: &error) as? [CoreLocation] {
            coreLocation = fetchResults
            println(coreLocation.count)
            if fetchResults.count > 0 {
                return fetchResults[0]
            }
            return nil
        }
        
        
        return nil
    }
    
    
    
    
    
    
    
    

}
