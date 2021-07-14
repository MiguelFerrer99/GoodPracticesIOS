//
//  EditProfile-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 14/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class EditProfileViewModel: ViewModel {
    
    //MARK: - Properties
    let usersService = UsersService()
    let firstName: String
    let lastName: String
    let email: String
    
    //MARK: - Initializer
    init() {
        self.firstName = User.me?.firstName ?? ""
        self.lastName = User.me?.lastName ?? ""
        self.email = User.me?.email ?? ""
    }
    
    //MARK: - Functions
    func editMe(email: String, firstName: String, lastName: String, completion: @escaping ((Result<User, API.NetworkError>) -> Void)) {
        if let id = User.me?.id {
            usersService.editMe(id: id, email: email, firstName: firstName, lastName: lastName) { result in
                completion(result)
            }
        }
    }
}
