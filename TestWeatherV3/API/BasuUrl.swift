//
//  BasuUrl.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/2/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

class BaseURL {
    
    static var shared = BaseURL.init()
    
    let baseURL: String
    
    private init() {
        self.baseURL = "https://api.openweathermap.org/data/2.5/forecast"
    }
}
