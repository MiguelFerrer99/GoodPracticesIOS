//
//  Login-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 14/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class LoginViewModel: ViewModel {
    
    //MARK: - Properties
    let authService = AuthService()
    
    //MARK: - Initializer
    
    //MARK: - Functions
    func login(username: String, password: String, completion: @escaping ((Result<AuthResponse, API.NetworkError>) -> Void)) {
        authService.login(username: username, password: password) { result in
            completion(result)
        }
    }
}
