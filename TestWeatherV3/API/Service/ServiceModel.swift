//
//  ServiceModel.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/1/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

protocol ServiceInterface {
    
    func getDataFromFile(completion: @escaping (Swift.Result<[City], ParseError>) -> Void)
    func getCitieWeatherWithId(model: IdRequestModel, completion: @escaping (Result<IdResponseModelImpl, ParseError>) -> Void)
    func getCitieWeatherByCoordinates()
}
