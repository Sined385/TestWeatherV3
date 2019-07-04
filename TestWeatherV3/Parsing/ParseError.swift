//
//  ParseError.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/1/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

enum ParseError: Error {
    case failure
    case cannotDescribeError
    case cannotRecieveData
}
