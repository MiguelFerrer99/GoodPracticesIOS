//
//  MethodologyHeaderCell-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class MethodologyHeaderCollectionCellViewModel: ViewModel {
    
    //MARK: - Properties
    var title: String
    var type: String
    var description: String
    var image: Image?
    var longDescription: String

    //MARK: - Initializer
    init(title: String, type: String, description: String, image: Image?, longDescription: String) {
      self.title = title
      self.type = type
      self.description = description
      self.image = image
      self.longDescription = longDescription
    }
}
