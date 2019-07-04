//
//  ParameterBuilder.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/2/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation
import Alamofire

protocol ParameterBuilderProtocol {
    
    var apiKey: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: Parameters { get }
}
