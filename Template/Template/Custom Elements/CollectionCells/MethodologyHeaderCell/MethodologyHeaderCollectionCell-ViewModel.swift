//
//  MethodologyHeaderCell-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class MethodologyHeaderCollectionCellViewModel: ViewModel {
    let name, subtitle, shortDescription, longDescription: String
    let image: UIImage
    
    init(name: String, subtitle: String, shortDescription:String, longDescription:String, image:UIImage) {
        self.name = name
        self.subtitle = subtitle
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.image = image
    }
}
