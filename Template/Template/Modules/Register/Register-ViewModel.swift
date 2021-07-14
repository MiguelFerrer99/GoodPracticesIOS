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
    let usersService = UsersService()
    let authService = AuthService()
    
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
    
    //MARK: - Initializer
    
    //MARK: - Functions
    func register(email: String, password: String, firstName: String, lastName: String, isBusiness: Bool, businessName: String, completionHandler: @escaping ((Result<RegisterResponse, API.NetworkError>) -> Void)) {
        usersService.register(email: email, password: password, firstName: firstName, lastName: lastName, isBusiness: isBusiness, businessName: businessName) { result in
            completionHandler(result)
        }
    }
    
    func login(username: String, password: String, completion: @escaping ((Result<AuthResponse, API.NetworkError>) -> Void)) {
        authService.login(username: username, password: password) { result in
            completion(result)
        }
    }
}
