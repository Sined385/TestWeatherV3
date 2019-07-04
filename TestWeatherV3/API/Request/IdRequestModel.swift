//
//  IdRequestModel.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/2/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

struct IdRequestModel {
    
    var id: Int
}

struct IdRequestConvertable: RequestConvertable {
    
    // MARK: -
    // MARK: Properties
    
    var apiKey: String
    var id: Int
    
    // MARK: -
    // MARK: Init
    
    init(model: IdRequestModel) {
        self.id = model.id
        self.apiKey = APIKey.prod.rawValue
    }
    
    // MARK: -
    // MARK: AsDictionary
    
    func asDictionary() -> [String : Any] {
        let params: [String : Any] = [IdParams.appId.rawValue : self.apiKey,
                                      IdParams.id.rawValue : self.id]
        return params
    }
}
