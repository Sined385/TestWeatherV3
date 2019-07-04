//
//  ParameterBuilder.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/2/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation
import Alamofire

enum ParameterBuilder: ParameterBuilderProtocol {
    
    case id(_ model: RequestConvertable)
    case coordinates(_ model: RequestConvertable)
    
    var apiKey: String {
        return APIKey.prod.rawValue
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .id:
            return .get
        case .coordinates:
            return .get
        }
    }
    
    var parameters: Parameters {
        
        switch self {
        case let .id(model),
             let .coordinates(model):
            return model.asDictionary()
        }
    }
}
