//
//  CoreDataStack.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/1/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack: CoreDataStackInterface {
    
    // MARK: -
    // MARK: Properties
    
    static var shared = CoreDataStack.init(modelName: "TestWeatherV3")
    
    var modelName: String
    
    // MARK: -
    // MARK: Init
    
    private init(modelName: String) {
        
        self.modelName = modelName
    }
    
    // MARK: -
    // MARK: Managing
    
    lazy var persistantStore: NSPersistentContainer = {
        
        let persistantContainer = NSPersistentContainer.init(name: "TestWeatherV3")
        persistantContainer.loadPersistentStores(completionHandler: { (description, error) in
            if let error = error as NSError? {
                print("ERROR \(error), \(error.userInfo)")
            }
        })
        return persistantContainer
    }()
    
    lazy var managedContext: NSManagedObjectContext? = {
        
        let context = self.persistantStore.newBackgroundContext()
        return context
    }()
    
    final func saveContext() {
        
        do {
            try managedContext!.save()
            print("Context was saved!")
        } catch {
            guard let error = error as NSError? else { return }
            print("ERROR \(error.userInfo)")
        }
    }
    
    final func fetchData<Entity: NSManagedObject>(entity: Entity.Type, entityName: String, completion: @escaping (Result<[Entity], CoreDataError>) -> Void) {
        
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest(managedObject: Entity.self, entityName: entityName)
        let asyncFetchRequest: NSAsynchronousFetchRequest<Entity> =
            NSAsynchronousFetchRequest<Entity>.init(fetchRequest: fetchRequest) { (result) in
                
                guard let data = result.finalResult else { return }
                completion(.success(data))
        }
        
        do {
            try managedContext?.execute(asyncFetchRequest)
        } catch let error as NSError {
            print(error.userInfo)
            completion(.failure(.cannotFetchData))
        }
    }
    
    final func deleteData<Entity: NSManagedObject>(entity: Entity.Type, entityName: String) {
        
        let fetchRequest: NSFetchRequest<Entity> = entity.fetchRequest(managedObject: Entity.self, entityName: entityName)
        
        do {
            guard let result = try managedContext?.fetch(fetchRequest) else {
                print("nothing to delete")
                return }
            for object in result {
                managedContext?.delete(object)
            }
        } catch let error as NSError {
            print(error.userInfo)
        }
    }
    
}

