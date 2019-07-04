//
//  RequestConvertable.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/2/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

protocol RequestConvertable {
    
    var apiKey: String { get }
    func asDictionary() -> [String : Any]
}
