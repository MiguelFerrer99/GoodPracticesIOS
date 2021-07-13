//
//  DetailHeaderCollectionCell-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 13/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class DetailHeaderCollectionCellViewModel: ViewModel {
    
    //MARK: - Properties
    let image: UIImage
    let shortDescription, longDescription: String
    
    //MARK: - Initializer
    init(image: UIImage, shortDescription: String, longDescription: String) {
        self.image = image
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
    
    //MARK: - Functions
}
