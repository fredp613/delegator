//
//  CoreDocument.swift
//  delegator
//
//  Created by Fred Pearson on 2015-01-31.
//  Copyright (c) 2015 Frederick Pearson. All rights reserved.
//

import Foundation
import CoreData

class CoreDocument: NSManagedObject {

    @NSManaged var created_by: String
    @NSManaged var created_on: NSDate
    @NSManaged var document_location: String
    @NSManaged var document_name: String
    @NSManaged var updated_by: String
    @NSManaged var updated_on: NSDate
    @NSManaged var document_workflows: CoreDocumentWorkflow
    @NSManaged var organization: CoreOrganization

}
