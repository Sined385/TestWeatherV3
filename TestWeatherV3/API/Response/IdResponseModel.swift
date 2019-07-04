//
//  IdResponseModel.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/2/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

protocol IdWeatherResponseModel {
    
    var city: CityResponse { get }
    var cod: String { get }
    var message: Double { get }
    var cnt: Int { get }
    var list: [WeatherList] { get }
}

protocol CityResponse {
    
    var id: Int { get }
    var name: String { get }
    var coord: CoordResponse { get }
    var timezone: Int { get }
    var country: String { get }
}

protocol CoordResponse {
    
    var lon: Double { get }
    var lat: Double { get }
}

protocol WeatherList {
    
    var date: Int { get }
    var main: Main { get }
    var weather: [Weather] { get }
    var clouds: Clouds { get }
    var wind: Wind { get }
    var textDate: String { get }
}

protocol Main {
    
    var temperature: Double { get }
    var minimalTemperature: Double { get }
    var maximumTemperature: Double { get }
    var pressure: Double { get }
    var seaLevel: Double { get }
    var groundLevel: Double { get }
    var humidity: Double { get }
    var temperatureKoef: Double { get }
}

protocol Weather {
    
    var id: Int { get }
    var main: String { get }
    var description: String { get }
    var icon: String { get }
}

protocol Clouds {
    
    var all: Double { get }
}

protocol Wind {
    
    var speed: Double { get }
    var degree: Double { get }
}
