//
//  FetchRequestable.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/3/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject {
    
    @nonobjc public class func fetchRequest<ManagedObject: NSManagedObject>(managedObject: ManagedObject.Type,
                                                                            entityName: String) -> NSFetchRequest<ManagedObject> {
        return NSFetchRequest<ManagedObject>.init(entityName: entityName)
    }
}
