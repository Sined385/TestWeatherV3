//
//  RootViewControllerProtocol.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/3/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

protocol RootViewControllerProtocol {
    
    associatedtype Model
    
    var model: Model? { get }
    
    func setUpUI()
}
