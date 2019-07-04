//
//  RootModel.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/3/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

class RootModel<DataSource: Any>: RootModelProtocol {
    
    typealias DataSourceType = DataSource
    
    var dataSource: DataSourceType?
    weak var delegateToController: ModelDelegate?
    
    required init() {
        
    }
    
}
