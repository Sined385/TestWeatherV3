//
//  City+CoreDataClass.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/1/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//
//

import Foundation
import CoreData

@objc(City)
public class City: NSManagedObject, Decodable {
    
    // MARK: -
    // MARK: Properties
    
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var country: String?
    @NSManaged public var coordinates: Coordinates?
    
    // MARK: -
    // MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case id, name, country, coordinates = "coord"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        
        guard let context = CoreDataStack.shared.managedContext as NSManagedObjectContext?,
            let entity = NSEntityDescription.entity(forEntityName: "City", in: context) else {
            fatalError()
        }
        
        self.init(entity: entity, insertInto: context)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int64.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.country = try values.decode(String.self, forKey: .country)
        self.coordinates = try values.decode(Coordinates.self, forKey: .coordinates)
    }
}
