//
//  Device.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class Device {
    let image: UIImage
    let name: String
    let brand: Brand
    
    init(name: String, image: UIImage, brand: Brand) {
        self.name = name
        self.image = image
        self.brand = brand
    }
}
