//
//  DeviceDetail-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class DeviceDetailViewModel: ViewModel {
    
    //MARK: - Properties
    var device: Device
    
    //MARK: - Initializer
    init(device: Device) {
        self.device = device
    }
    
    //MARK: - Functions
}
