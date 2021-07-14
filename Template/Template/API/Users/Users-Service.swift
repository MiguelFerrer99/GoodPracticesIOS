//
//  Users-Service.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 14/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

class UsersService {
    
    func register(email: String,
                  password: String,
                  firstName: String,
                  lastName: String,
                  isBusiness: Bool,
                  businessName: String,
                  completionHandler: @escaping ((Result<RegisterResponse, API.NetworkError>) -> Void)) {
      
      let parameters: [String: Any] = [
        "email" : email,
        "username" : email,
        "password" : password,
        "first_name": firstName,
        "last_name": lastName,
        "is_business": isBusiness,
        "business_name": businessName
      ]
      
      API.shared.callDecoding(UsersAPI.register(parameters), of: RegisterResponse.self) { result in
        completionHandler(result)
      }
    }
    
    func updatePassword(oldPassword: String, newPassword: String, completionHandler: @escaping ((Result<[String: String], API.NetworkError>) -> Void)) {
      let parameters: [String: Any] = [
        "old_password": oldPassword,
        "new_password": newPassword
      ]
      
      API.shared.callDecoding(UsersAPI.updatePassword(parameters), of: [String: String].self) { result in
        completionHandler(result)
      }
    }
    
    func newPassword(email: String, completion: @escaping ((Result<[String: String], API.NetworkError>) -> Void)) {
      let parameters: [String: Any] = [
        "email": email
      ]
      
      API.shared.callDecoding(UsersAPI.newPassword(parameters), of: [String: String].self) { result in
        completion(result)
      }
    }
    
    func getMe(completion: @escaping ((Result<User, API.NetworkError>) -> Void)) {
      API.shared.callDecoding(UsersAPI.getMe, of: User.self) { result in
        switch result {
        case .success(let response):
          User.me = response
          completion(.success(response))
        case .failure(let error):
          completion(.failure(error))
        }
      }
    }
    
    func editMe(id: String, email: String, firstName: String, lastName: String, completion: @escaping ((Result<User, API.NetworkError>) -> Void)) {
      let parameters: [String: Any] = [
        "email": email,
        "username": email,
        "first_name": firstName,
        "last_name": lastName,
      ]
      
      API.shared.callDecoding(UsersAPI.editMe(id, parameters), of: User.self) { result in
        switch result {
        case .success(let user):
          User.me = user
          completion(result)
        
        case .failure(_):
          completion(result)
        }
      }
    }
}
