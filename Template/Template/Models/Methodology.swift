//
//  Methodology.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class Methodology {
    let index: Int
    let name, subtitle, shortDescription: String, longDescription: String
    let image: UIImage
    var isSaved: Bool
    let products: [Product]
    let devices: [Device]
    let steps: [Step]
    
    init(index: Int, name: String, subtitle: String, shortDescription: String, longDescription: String, isSaved: Bool, image: UIImage, products: [Product], devices: [Device], steps: [Step]) {
        self.index = index
        self.name = name
        self.subtitle = subtitle
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.isSaved = isSaved
        self.image = image
        self.products = products
        self.devices = devices
        self.steps = steps
    }
}
