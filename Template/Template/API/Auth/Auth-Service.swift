//
//  Auth-Service.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 14/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

class AuthService {
    
    func login(username: String, password: String, completion: @escaping ((Result<AuthResponse, API.NetworkError>) -> Void)) {
        
        let parameters: [String: Any] = [
            "grant_type" : "password",
            "client_id" : APIKeys.clientID,
            "client_secret" : APIKeys.clientSecret,
            "username" : username,
            "password" : password
        ]
        
        API.shared.auth(AuthAPI.login(parameters as [String: AnyObject]), of: AuthResponse.self) { result in
            switch result {
            case .success(let response):
                UsersService().getMe { _ in }
                Cache.set(.access_token, response.accessToken)
                Cache.set(.refresh_token, response.refreshToken)
                Cache.set(.logged, true)
                completion(result)
                
            case .failure(_):
                completion(.failure(.badResponse))
            }
        }
    }
    
    func refreshToken(withToken token: String, completion: @escaping ((Result<AuthResponse, API.NetworkError>) -> Void)) {
        
        let parameters: [String: Any] = [
            "grant_type" : "refresh_token",
            "client_id" : APIKeys.clientID,
            "client_secret" : APIKeys.clientSecret,
            "refresh_otken": token
        ]
        
        API.shared.auth(AuthAPI.refreshToken(parameters as [String: AnyObject]), of: AuthResponse.self) { result in
            switch result {
            case .success(let response):
                Cache.set(.access_token, response.accessToken)
                Cache.set(.refresh_token, response.refreshToken)
                completion(result)
            case .failure(_):
                completion(.failure(.badResponse))
            }
        }
    }
    
    func logout() {
        Cache.logOut()
        User.me = nil
    }
}
