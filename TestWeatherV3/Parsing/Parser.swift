//
//  Parser.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/1/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

class Parser {
    
    let decoder: JSONDecoder
    
    init() {
        
        self.decoder = JSONDecoder.init()
    }
    
    func parse<DecodingType: Decodable>(json: Data, type: DecodingType.Type) -> Result<DecodingType, Error> {
        
        do {
            let result = try decoder.decode(DecodingType.self, from: json)
            return .success(result)
        } catch {
            guard let error = error as NSError? else { return .failure(ParseError.cannotDescribeError) }
            print(error)
            return .failure(ParseError.failure)
        }
    }
}

