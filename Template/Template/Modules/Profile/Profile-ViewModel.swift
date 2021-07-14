//
//  Profile-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 14/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class ProfileViewModel: ViewModel {
    
    //MARK: - Properties
    let usersService = UsersService()
    let authService = AuthService()
    
    var email: String
    var fullName: String
    
    //MARK: - Initializer
    init() {
        self.email = "cleanapp@cleanapp.com"
        self.fullName = "Nombre Apellidos"
    }
    
    //MARK: - Functions
    func getMe() {
        if let user = User.me {
            self.fullName = "\(user.firstName ?? "") \(user.lastName ?? "")"
            self.email = (user.email ?? "")
        }
    }
}
