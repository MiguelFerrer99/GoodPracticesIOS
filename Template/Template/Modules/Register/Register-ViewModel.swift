//
//  Register-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 13/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

class RegisterViewModel: ViewModel {
    
    //MARK: - Properties
    var _isCompany = Dynamic(false)
    var isCompany: Bool {
        get { _isCompany.value }
        set { _isCompany.value = newValue }
    }
    var _isTermsChecked = Dynamic(false)
    var isTermsChecked: Bool {
        get { _isTermsChecked.value }
        set { _isTermsChecked.value = newValue }
    }
}
