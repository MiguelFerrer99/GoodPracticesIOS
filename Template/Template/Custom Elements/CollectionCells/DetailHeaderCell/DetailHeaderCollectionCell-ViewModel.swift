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
    let image: Image?
    let shortDescription, longDescription, url: String
    
    //MARK: - Initializer
    init(image: Image?, shortDescription: String, longDescription: String, url: String) {
      self.image = image
      self.shortDescription = shortDescription
      self.longDescription = longDescription
      self.url = url
    }
}
