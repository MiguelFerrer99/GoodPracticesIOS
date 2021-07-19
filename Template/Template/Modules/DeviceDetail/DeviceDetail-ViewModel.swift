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
    let device: Device?
    var deviceDetail: DeviceDetail?
    
    let collectionManager = DeviceDetailCollectionManager()
    let devicesService = DevicesService()
    
    //MARK: - Initializer
    init(device: Device? = nil, deviceDetail: DeviceDetail? = nil) {
        self.device = device
        self.deviceDetail = deviceDetail
    }
    
    //MARK: - Functions
    func getDeviceDetail(_ completion: @escaping ((Result<DeviceDetail, API.NetworkError>) -> Void)) {
        guard deviceDetail == nil else { return }
        if let id = device?.id {
            devicesService.getDeviceDetail(deviceID: id) { result in
                switch result {
                case .success(let deviceDetail):
                    self.deviceDetail = deviceDetail
                    completion(result)
                    
                case .failure(_):
                    completion(result)
                }
            }
        }
    }
}
