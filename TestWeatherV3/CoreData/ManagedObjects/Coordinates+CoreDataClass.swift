//
//  Coordinates+CoreDataClass.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/1/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Coordinates)
public class Coordinates: NSManagedObject, Decodable {
    
    @NSManaged public var latitude: Double
    @NSManaged public var longtitude: Double
    @NSManaged public var city: City?
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat", longtitude = "lon"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        
        guard let context = CoreDataStack.shared.managedContext as NSManagedObjectContext?,
            let entity = NSEntityDescription.entity(forEntityName: "Coordinates", in: context) else {
                fatalError()
        }
        
        self.init(entity: entity, insertInto: context)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try values.decode(Double.self, forKey: .latitude)
        self.longtitude = try values.decode(Double.self, forKey: .longtitude)
        
    }
    
}
