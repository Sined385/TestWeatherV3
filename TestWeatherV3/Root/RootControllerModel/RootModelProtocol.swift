//
//  RootModelProtocol.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/3/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

protocol RootModelProtocol: class {
    
    associatedtype DataSourceType
    
    var delegateToController: ModelDelegate? { get set }
    var dataSource: DataSourceType? { get }
    
    init()
}
