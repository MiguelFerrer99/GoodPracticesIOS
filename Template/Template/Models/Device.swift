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
    let products: [Product]
    let attachments: [Device]
    let shortDescription: String
    let longDescription: String
    
    init(name: String, image: UIImage, brand: Brand, shortDescription: String, longDescription: String, attachments: [Device], products: [Product]) {
        self.name = name
        self.image = image
        self.brand = brand
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.attachments = attachments
        self.products = products
    }
}
