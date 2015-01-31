//
//  CoreDocumentWorkflow.swift
//  delegator
//
//  Created by Fred Pearson on 2015-01-31.
//  Copyright (c) 2015 Frederick Pearson. All rights reserved.
//

import Foundation
import CoreData

class CoreDocumentWorkflow: NSManagedObject {
    
    enum documentDecision : Int {
        case approved = 1
        case denied = 2
        case review = 3
    }

    @NSManaged var created_by: String
    @NSManaged var created_on: NSDate
    @NSManaged var document_workflow_id: String
    @NSManaged var position: NSNumber
    @NSManaged var updated_by: String
    @NSManaged var updated_on: NSDate
    @NSManaged var decision: NSNumber
    @NSManaged var document: NSManagedObject
    @NSManaged var user: NSManagedObject

}
