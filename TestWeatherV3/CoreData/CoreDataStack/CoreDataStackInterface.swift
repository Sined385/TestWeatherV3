//
//  CoreDataStackInterface.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/3/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataStackInterface {
    
    var modelName: String { get }
    var persistantStore: NSPersistentContainer { get }
    var managedContext: NSManagedObjectContext? { get }
    
    func saveContext()
    func fetchData<Entity: NSManagedObject>(entity: Entity.Type, entityName: String,
                                            completion: @escaping (Result<[Entity], CoreDataError>) -> Void)
    func deleteData<Entity: NSManagedObject>(entity: Entity.Type, entityName: String)
}
