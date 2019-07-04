//
//  RequestBuilder.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/2/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation
import Alamofire

struct RequestParameters {
    
    var url: URLConvertible
    var method: HTTPMethod
    var parameters: Parameters?
    var headers: HTTPHeaders?
}

class RequestBuilder: RequestBuilderProtocol {
    
    typealias ParameterBuilderType = ParameterBuilder
    
    var baseURL: String
    
    required init(url: String) {
        self.baseURL = url
    }
    
    func urlRequest(for params: ParameterBuilderType) -> RequestParameters? {
        
        guard let url = URL.init(string: baseURL) else { return nil }
        
        switch params.httpMethod {
        case .get:
            let requestParams = RequestParameters.init(url: url, method: params.httpMethod, parameters: params.parameters, headers: nil)
            return requestParams
        default:
            return nil
        }
    }
}
