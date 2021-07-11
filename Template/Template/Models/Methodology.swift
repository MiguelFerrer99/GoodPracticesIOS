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
    let name, subtitle, shortDescription: String
    let image: UIImage
    var isSaved: Bool
    
    init(index: Int, name: String, subtitle: String, shortDescription: String, isSaved: Bool, image: UIImage) {
        self.index = index
        self.name = name
        self.subtitle = subtitle
        self.shortDescription = shortDescription
        self.isSaved = isSaved
        self.image = image
    }
}
