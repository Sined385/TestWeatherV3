//
//  CoreService.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/2/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation
import Alamofire

class CoreService<RequestBuilderType: RequestBuilderProtocol>: CoreServiceProtocol {
    
    typealias RequestBuilderType = RequestBuilderType
    
    var builder: RequestBuilderType
    private let session = Alamofire.Session.default
    private let parser = Parser.init()
    private let requestBGQ = DispatchQueue.global(qos: .userInitiated)
    
    typealias Completion<T: Decodable> = (Swift.Result<T, ParseError>) -> Void
    
    required init(with builder: RequestBuilderType) {
        self.builder = builder
    }
    
    func performRequest<ResponseType: Decodable>(parameterBuilder: RequestBuilderType.ParameterBuilderType, responseModel: ResponseType.Type,
                                                 completion: @escaping Completion<ResponseType>) {
        
        guard let requestParams = builder.urlRequest(for: parameterBuilder) else { return }
        
        let _ = session.request(requestParams.url, method: requestParams.method, parameters: requestParams.parameters, encoding: URLEncoding.default,
                                headers: requestParams.headers, interceptor: nil).responseJSON { (response) in
                                    
                                    guard let data = response.data else {
                                        completion(.failure(.cannotRecieveData))
                                        return
                                    }
                                    
                                    let result = self.parser.parse(json: data, type: ResponseType.self)
                                    
                                    switch result {
                                    case .success(let resultData):
                                        completion(.success(resultData))
                                    case .failure:
                                        completion(.failure(.failure))
                                    }
        }
        
    }
    
    func getFromFile(completion: @escaping Completion<[City]>) {
        
        if let path = Bundle.main.path(forResource: "city.list", ofType: "json") {
            let url = URL.init(fileURLWithPath: path)
            
            requestBGQ.async {
                
                self.session.request(url).responseJSON { (response) in
                    
                    guard let data = response.data else {
                        completion(.failure(.failure))
                        return
                    }
                    
                    let result = self.parser.parse(json: data, type: [City].self)
                    
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let resultData):
                            completion(.success(resultData))
                        case .failure:
                            completion(.failure(.failure))
                        }
                    }
                }
            }
        }
    }
    
}


