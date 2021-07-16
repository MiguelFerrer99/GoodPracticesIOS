//
//  Devices-Service.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

class DevicesService {
    func getDeviceDetail(deviceID: String, completionHandler: @escaping ((Result<DeviceDetail, API.NetworkError>) -> Void)) {
      API.shared.callDecoding(DevicesAPI.getDeviceDetail(deviceID), of: DeviceDetail.self, completion: completionHandler)
    }

    func getBrands(completionHandler: @escaping ((Result<[Brand], API.NetworkError>) -> Void)) {
      API.shared.callDecoding(DevicesAPI.getBrands, of: [Brand].self, completion: completionHandler)
    }

    func getDevices(brandID: String, itemTypeID: String, completionHandler: @escaping ((Result<[DeviceDetail], API.NetworkError>) -> Void)) {

      let parameters = [
        "brand_id": brandID,
        "item_type_id": itemTypeID
      ]

      API.shared.callDecoding(DevicesAPI.getDevices(parameters), of: [DeviceDetail].self, completion: completionHandler)
    }

    func getItemTypes(completionHandler: @escaping ((Result<[ItemType], API.NetworkError>) -> Void)) {
      API.shared.callDecoding(DevicesAPI.getItemTypes, of: [ItemType].self, completion: completionHandler)
    }
}
