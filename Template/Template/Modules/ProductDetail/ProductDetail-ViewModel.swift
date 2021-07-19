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
    let product: Product?
    var productDetail: ProductDetail?
    
    let collectionManager = ProductDetailCollectionManager()
    let productsService = ProductsService()
    
    //MARK: - Initializer
    init(product: Product? = nil, productDetail: ProductDetail? = nil) {
        self.product = product
        self.productDetail = productDetail
    }
    
    //MARK: - Functions
    func getProductDetail(_ completion: @escaping ((Result<ProductDetail, API.NetworkError>) -> Void)) {
        guard productDetail == nil else { return }
        if let id = product?.id {
            productsService.getProductDetail(productId: id) { result in
                switch result {
                case .success(let productDetail):
                    self.productDetail = productDetail
                    completion(result)
                case .failure(_):
                    completion(result)
                }
            }
        }
    }
}
