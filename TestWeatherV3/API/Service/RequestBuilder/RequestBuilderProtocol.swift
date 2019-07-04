//
//  RequestBuilderProtocol.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/2/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

protocol RequestBuilderProtocol {
    
    associatedtype ParameterBuilderType
    
    var baseURL: String { get }
    init(url: String)
    func urlRequest(for params: ParameterBuilderType) -> RequestParameters?
}
