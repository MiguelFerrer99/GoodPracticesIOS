//
//  ProductDetail-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class ProductDetailViewModel: ViewModel {
    
    //MARK: - Properties
    var product: Product
    
    //MARK: - Initializer
    init(product: Product) {
        self.product = product
    }
    
    //MARK: - Functions
}