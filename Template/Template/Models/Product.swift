//
//  Brand.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class Product {
    let image: UIImage
    let name: String
    let brand: Brand
    let related: [Product]
    var devices: [Device]
    let shortDescription: String
    let longDescription: String
    
    init(image: UIImage, name: String, brand: Brand, shortDescription: String, longDescription: String, related: [Product], devices: [Device]) {
        self.image = image
        self.name = name
        self.brand = brand
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.related = related
        self.devices = devices
    }
}
