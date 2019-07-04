//
//  RootViewController.swift
//  TestWeatherV3
//
//  Created by Денис Ефремов on 7/3/19.
//  Copyright © 2019 Денис Ефремов. All rights reserved.
//

import Foundation
import UIKit

class RootViewController<Model: RootModelProtocol>: UIViewController,
                                                    RootViewControllerProtocol,
                                                    ModelDelegate {
    
    // MARK: -
    // MARK: Properties
    
    var model: Model?
    
    // MARK: -
    // MARK: Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model = Model.init()
        guard let model = model else { return }
        model.delegateToController = self
    }
    
    // MARK: -
    // MARK: Methods
    
    func setUpUI() {
        
    }
    
    // MARK: -
    // MARK: Delegate
    
    func modelDelegate() {
        
    }
}
