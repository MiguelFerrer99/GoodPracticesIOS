//
//  Products-Service.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 18/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

class ProductsService {
    
    func getProductDetail(productId: String, completionHandler: @escaping ((Result<ProductDetail, API.NetworkError>) -> Void)) {
      API.shared.callDecoding(ProductsAPI.getProductDetail(productId), of: ProductDetail.self, completion: completionHandler)
    }
}
