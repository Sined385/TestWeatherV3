//
//  ListTVCModel.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/3/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation
import UIKit

class ListTVC: RootViewController<ListTVCModel>, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: -
    // MARK: TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let dataSource = model?.dataSource else { return 0 }
        return dataSource.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        guard let dataSource = model?.dataSource else { return UITableViewCell() }
        cell.textLabel?.text = dataSource[indexPath.row].name
        return cell
    }
    
    // MARK: -
    // MARK: Delegate
    
    override func modelDelegate() {
        
        tableView.reloadData()
    }
    
    
}
