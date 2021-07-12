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
    let collectionManager = MethodologyCollectionManager()
    
    //MARK: - Initializer
    init(methodology: Methodology) {
        self.methodology = methodology
    }
    
    //MARK: - Functions
}
