//
//  Coordinates+CoreDataProperties.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/1/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//
//

import Foundation
import CoreData

extension Coordinates {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coordinates> {
        return NSFetchRequest<Coordinates>(entityName: "Coordinates")
    }
}
