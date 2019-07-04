//
//  ListTVC.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/3/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation

class ListTVCModel: RootModel<[City]> {
    
    // MARK: -
    // MARK: Properties
    
    var requestBuilder: RequestBuilder
    var apiClient: WeatherAPIService
    
    // MARK: -
    // MARK: Init
    
    required init() {
        self.requestBuilder = RequestBuilder.init(url: BaseURL.shared.baseURL)
        self.apiClient = WeatherAPIService.init(with: requestBuilder)
        super.init()
        getCities()
    }
    
    // MARK: -
    // MARK: Methods
    
    // MARK: -
    // MARK: GetData
    
    public func getCities() {
        
        CoreDataStack.shared.fetchData(entity: City.self, entityName: "City") { (result) in
            switch result {
            case .success(let data):
               self.ifPresent(data: data)
            case .failure(let error as NSError?):
                print(error!.userInfo)
            }
        }
    }
    
    private func ifPresent(data: [City]) {
        
        if data.count != 0 {
            self.dataSource = data
            DispatchQueue.main.async {
                self.delegateToController?.modelDelegate()
            }
        } else {
            getFromFile()
        }
    }
    
    private func getFromFile() {
        
        self.apiClient.getDataFromFile(completion: { (result) in
            switch result {
            case .success(let data):
                self.dataSource = data
                DispatchQueue.main.async {
                    self.delegateToController?.modelDelegate()
                }
                CoreDataStack.shared.saveContext()
            case .failure(let error as NSError?):
                print(error!.userInfo)
            }
        })
    }
    
    // MARK: -
    // MARK: MapCities
    
    
    
}
