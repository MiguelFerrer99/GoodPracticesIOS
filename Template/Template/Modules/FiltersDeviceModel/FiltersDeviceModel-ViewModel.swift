//
//  FiltersDeviceModel-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

protocol FiltersDeviceModelDelegate: AnyObject {
    func changeQuestion(question: Question, index: Int)
    func changeSelectedDevice(device: DeviceDetail)
}

class FiltersDeviceViewModel: ViewModel {
    
    //MARK: - Properties
    var question: Question?
    var index: Int
    weak var delegate: FiltersDeviceModelDelegate?
    
    var devidesService = DevicesService()
    
    var devices: [DeviceDetail]?
    var selectedBrand: Brand?
    var selectedType: ItemType?
    var answers: [Answer] = []
    
    //MARK: - Initializer
    init(index: Int, selectedBrand: Brand? = nil, selectedType: ItemType? = nil) {
        self.index = index
        self.selectedBrand = selectedBrand
        self.selectedType = selectedType
    }
    
    //MARK: - Functions
    
    func getDevices(completionHandler: @escaping ((Result<[DeviceDetail], API.NetworkError>) -> Void)) {
        if let brand = selectedBrand, let type = selectedType {
            devidesService.getDevices(brandID: brand.id, itemTypeID: type.id) { result in
                if case .success(let devices) = result {
                    self.devices = devices
                    for device in devices {
                        self.answers.append(Answer(text: device.name!, imagePath: device.image?.midsize ?? ""))
                        self.question = Question(title: "Modelos disponibles", question: "Modelos disponibles", answers: self.answers)
                    }
                }
                completionHandler(result)
            }
        }
    }
}
