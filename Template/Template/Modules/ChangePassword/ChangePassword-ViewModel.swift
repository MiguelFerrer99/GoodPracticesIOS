//
//  ChangePassword-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 14/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class ChangePasswordViewModel: ViewModel {
    
    //MARK: - Properties
    let usersService = UsersService()
    
    //MARK: - Initializer
    
    //MARK: - Functions
    func updatePassword(oldPassword: String, newPassword: String, completion: @escaping ((Result<[String: String], API.NetworkError>) -> Void)) {
        usersService.updatePassword(oldPassword: oldPassword, newPassword: newPassword) { result in
            completion(result)
        }
    }
}
