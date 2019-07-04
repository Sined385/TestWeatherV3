//
//  CoreSeviceProtocol.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/2/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

protocol CoreServiceProtocol {
    
    associatedtype RequestBuilderType: RequestBuilderProtocol
    
    var builder: RequestBuilderType { get }
    init(with builder: RequestBuilderType)
    func performRequest<Response: Decodable>(parameterBuilder: RequestBuilderType.ParameterBuilderType, responseModel: Response.Type,
                                             completion: @escaping (Swift.Result<Response, ParseError>) -> Void)
}
