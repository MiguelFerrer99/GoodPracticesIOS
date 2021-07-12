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
    
    init(image: UIImage, name: String, brand: Brand) {
        self.image = image
        self.name = name
        self.brand = brand
    }
}
