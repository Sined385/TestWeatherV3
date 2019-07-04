//
//  IdResponseModelImpl.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/2/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

class IdResponseModelImpl: IdWeatherResponseModel, Decodable {
    
    // MARK: -
    // MARK: Properties
    
    var city: CityResponse
    var cod: String
    var message: Double
    var cnt: Int
    var list: [WeatherList]
    
    // MARK: -
    // MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case city, timezone, cod, message, cnt, list
    }
    
    // MARK: -
    // MARK: Init and Decodable
    
    required init(from decoder: Decoder) throws {
        
        let decoding = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try decoding.decode(CityResponseImpl.self, forKey: .city)
        self.cod = try decoding.decode(String.self, forKey: .cod)
        self.message = try decoding.decode(Double.self, forKey: .message)
        self.cnt = try decoding.decode(Int.self, forKey: .cnt)
        self.list = try decoding.decode(Array<WeatherListImpl>.self, forKey: .list)
    }
    
}

class CityResponseImpl: CityResponse, Decodable {
    
    // MARK: -
    // MARK: Properties
    
    var id: Int
    var timezone: Int
    var name: String
    var country: String
    var coord: CoordResponse
    
    // MARK: -
    // MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case id, name, coord, timezone, country
    }
    
    // MARK: -
    // MARK: Init and Decodable
    
    required init(from decoder: Decoder) throws {
        
        let decoding = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try decoding.decode(Int.self, forKey: .id)
        self.name = try decoding.decode(String.self, forKey: .name)
        self.coord = try decoding.decode(CoordResponseImpl.self, forKey: .coord)
        self.timezone = try decoding.decode(Int.self, forKey: .timezone)
        self.country = try decoding.decode(String.self, forKey: .country)
    }
}

class CoordResponseImpl: CoordResponse, Decodable {
    
    // MARK: -
    // MARK: Properties
    
    var lon: Double
    var lat: Double
    
    // MARK: -
    // MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case lon,lat
    }
    
    // MARK: -
    // MARK: Init and Decodable
    
    required init(from decoder: Decoder) throws {
        
        let decoding = try decoder.container(keyedBy: CodingKeys.self)
        self.lon = try decoding.decode(Double.self, forKey: .lon)
        self.lat = try decoding.decode(Double.self, forKey: .lat)
    }
}

class WeatherListImpl: WeatherList, Decodable {
    
    // MARK: -
    // MARK: Properties
    
    var date: Int
    var main: Main
    var weather: [Weather]
    var clouds: Clouds
    var wind: Wind
    var textDate: String
    
    // MARK: -
    // MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case date = "dt", main, weather, clouds, wind, textDate = "dt_txt"
    }
    
    // MARK: -
    // MARK: Init and Decodable
    
    required init(from decoder: Decoder) throws {
        
        let decoding = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try decoding.decode(Int.self, forKey: .date)
        self.main = try decoding.decode(MainImpl.self, forKey: .main)
        self.weather = try decoding.decode(Array<WeatherImpl>.self, forKey: .weather)
        self.clouds = try decoding.decode(CloudsImpl.self, forKey: .clouds)
        self.wind = try decoding.decode(WindIml.self, forKey: .wind)
        self.textDate = try decoding.decode(String.self, forKey: .textDate)
        
    }
}

class MainImpl: Main, Decodable {
    
    // MARK: -
    // MARK: Properties
    
    var temperature: Double
    var minimalTemperature: Double
    var maximumTemperature: Double
    var pressure: Double
    var seaLevel: Double
    var groundLevel: Double
    var humidity: Double
    var temperatureKoef: Double
    
    // MARK: -
    // MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp", minimalTemperature = "temp_min", maximumTemperature = "temp_max",
        pressure, seaLevel = "sea_level", groundLevel = "grnd_level", humidity, temperatureKoef = "temp_kf"
    }
    
    // MARK: -
    // MARK: Init and Decodable
    
    required init(from decoder: Decoder) throws {
        
        let decoding = try decoder.container(keyedBy: CodingKeys.self)
        self.temperature = try decoding.decode(Double.self, forKey: .temperature)
        self.minimalTemperature = try decoding.decode(Double.self, forKey: .minimalTemperature)
        self.maximumTemperature = try decoding.decode(Double.self, forKey: .maximumTemperature)
        self.pressure = try decoding.decode(Double.self, forKey: .pressure)
        self.seaLevel = try decoding.decode(Double.self, forKey: .seaLevel)
        self.groundLevel = try decoding.decode(Double.self, forKey: .groundLevel)
        self.humidity = try decoding.decode(Double.self, forKey: .humidity)
        self.temperatureKoef = try decoding.decode(Double.self, forKey: .temperatureKoef)
    }
    
}

class WeatherImpl: Weather, Decodable {
    
    // MARK: -
    // MARK: Properties
    
    var id: Int
    var main: String
    var description: String
    var icon: String
    
    // MARK: -
    // MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case id, main, description, icon
    }
    
    // MARK: -
    // MARK: Init and Decodable
    
    required init(from decoder: Decoder) throws {
        
        let decoding = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try decoding.decode(Int.self, forKey: .id)
        self.main = try decoding.decode(String.self, forKey: .main)
        self.description = try decoding.decode(String.self, forKey: .description)
        self.icon = try decoding.decode(String.self, forKey: .icon)
    }
}

class CloudsImpl: Clouds, Decodable {
    
    // MARK: -
    // MARK: Properties
    
    var all: Double
    
    // MARK: -
    // MARK: CodingKeys
    
    enum codingKeys: String, CodingKey {
        case all
    }
    
    // MARK: -
    // MARK: Init and Decodable
    
    required init(from decoder: Decoder) throws {
        
        let decoding = try decoder.container(keyedBy: codingKeys.self)
        self.all = try decoding.decode(Double.self, forKey: .all)
    }
}


class WindIml: Wind, Decodable {
    
    // MARK: -
    // MARK: Properties
    
    var speed: Double
    var degree: Double
    
    // MARK: -
    // MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case speed, degree = "deg"
    }
    
    // MARK: -
    // MARK: Init and Decodable
    
    required init(from decoder: Decoder) throws {
        
        let decoding = try decoder.container(keyedBy: CodingKeys.self)
        self.speed = try decoding.decode(Double.self, forKey: .speed)
        self.degree = try decoding.decode(Double.self, forKey: .degree)
    }
    
}
