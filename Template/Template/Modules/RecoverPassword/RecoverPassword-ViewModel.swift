//
//  RecoverPassword-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 14/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class RecoverPasswordViewModel: ViewModel {
    
    //MARK: - Properties
    let usersService = UsersService()
    
    //MARK: - Initializer
    
    //MARK: - Functions
    func newPassword(email: String, completion: @escaping ((Result<[String: String], API.NetworkError>) -> Void)) {
        usersService.newPassword(email: email) { result in
            completion(result)
        }
    }
}
