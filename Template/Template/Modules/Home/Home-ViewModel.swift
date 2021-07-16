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
    private(set) var _methods: Dynamic<[Methodology]> = Dynamic([])
    var methods: [Methodology] {
      get { _methods.value }
      set { _methods.value = newValue }
    }
    
    //MARK: - Initializer
    
    //MARK: - Functions
}
