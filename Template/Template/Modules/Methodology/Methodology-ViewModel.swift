//
//  Methodology-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class MethodologyViewModel: ViewModel {
    
    //MARK: - Properties
    var methodology: Methodology
    
    let methodologiesService = MethodologiesService()
    let collectionManager = MethodologyCollectionManager()
    
    //MARK: - Initializer
    init(methodology: Methodology) {
        self.methodology = methodology
    }
    
    //MARK: - Functions
    func saveMethodology(_ completion: @escaping ((Result<[String: String], API.NetworkError>) -> Void)) {
        methodologiesService.saveMethodology(methodologyId: methodology.id, completionHandler: completion)
    }
}
