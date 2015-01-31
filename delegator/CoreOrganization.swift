//
//  CoreOrganization.swift
//  delegator
//
//  Created by Fred Pearson on 2015-01-31.
//  Copyright (c) 2015 Frederick Pearson. All rights reserved.
//

import Foundation
import CoreData

class CoreOrganization: NSManagedObject {

    enum organizationType : Int {
      case Profit = 1
      case Charity = 2
      case Government = 3
      case Individual = 4
    }
    
    @NSManaged var created_by: NSDate
    @NSManaged var created_on: String
    @NSManaged var organization_id: String
    @NSManaged var organization_name: String
    @NSManaged var organization_type: NSNumber
    @NSManaged var updated_by: String
    @NSManaged var updated_on: NSDate
    @NSManaged var user: NSManagedObject
    @NSManaged var documents: NSManagedObject

}
