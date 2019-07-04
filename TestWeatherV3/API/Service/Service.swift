//
//  Service.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/1/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

class WeatherAPIService: CoreService<RequestBuilder>, ServiceInterface {
   
    // MARK: -
    // MARK: Properties

    typealias Completion<T> = (Swift.Result<T, ParseError>) -> Void
    let apiKey = APIKey.prod
    
    // MARK: -
    // MARK: Methods
    
    final func getDataFromFile(completion: @escaping Completion<[City]>) {
        
        super.getFromFile { (result) in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure:
                completion(.failure(.failure))
            }
        }
    }
    
    func getCitieWeatherWithId(model: IdRequestModel, completion: @escaping (Result<IdResponseModelImpl, ParseError>) -> Void) {
        
        let requestConvertable = IdRequestConvertable.init(model: model)
        super.performRequest(parameterBuilder: .id(requestConvertable), responseModel: IdResponseModelImpl.self) { (result) in
            
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure:
                completion(.failure(.failure))
            }
        }
    }
    
    final func getCitieWeatherByCoordinates() {
        
    }
}
