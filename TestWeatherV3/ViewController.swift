//
//  ViewController.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/1/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import UIKit

class CitiesListTVC: UITableViewController {
    
    var dataSource: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let builder = RequestBuilder.init(url: BaseURL.shared.baseURL)
        let apiClient = WeatherAPIService.init(with: builder)
        apiClient.getDataFromFile { (result) in
            switch result {
            case .success(let data):
                self.dataSource = data
                self.tableView.reloadData()
            case .failure:
                print("getting from file error")
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row].name
        cell.detailTextLabel?.text = "►"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
