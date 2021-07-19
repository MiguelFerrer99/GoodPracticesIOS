//
//  SavedElements-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class SavedElementsViewModel: ViewModel {
    
    //MARK: - Properties
    var savedMethodologies: [Methodology]
    var isLoading: Bool = true
    
    let methodologiesService = MethodologiesService()
    
    //MARK: - Initializer
    init() {
        self.savedMethodologies = []
    }
    
    //MARK: - Functions
    func getSavedMethodologies(_ completion: @escaping ((Result<[Methodology], API.NetworkError>) -> Void)) {
        methodologiesService.getSavedMethodologies { result in
            switch result {
            case .success(let methodologies):
                self.savedMethodologies = methodologies
                completion(result)
            case .failure(_):
                completion(result)
            }
        }
    }
}
