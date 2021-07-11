//
//  FilterDevices-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 10/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FilterDevicesViewModel: ViewModel {
    
    //MARK: - Properties
    var title: String
    var devices: [Answer]
    var filterIndex: Int
    
    //MARK: - Initializer
    init(title: String, devices: [Answer], filterIndex: Int) {
        self.title = title
        self.devices = devices
        self.filterIndex = filterIndex
    }
    
    //MARK: - Functions
}
