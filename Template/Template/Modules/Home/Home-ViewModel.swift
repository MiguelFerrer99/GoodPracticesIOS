//
//  Home-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class HomeViewModel: ViewModel {
    
    //MARK: - Properties
    var methodologies: [Methodology]
    
    var methodology1 = Methodology(index: 0, name: "Aspirado Seco", subtitle: "Aspirar", shortDescription: "Se trata de un aspirado seco el cual mejora las cualidades del objeto, alargando su vida", isSaved: false, image: UIImage(named: "methodology1_image")!)
    
    //MARK: - Initializer
    init() {
        methodologies = [methodology1]
    }
    
    //MARK: - Functions
}
