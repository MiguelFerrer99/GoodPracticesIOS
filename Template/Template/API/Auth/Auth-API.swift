//
//  Auth-API.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 14/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation
import Alamofire

enum AuthAPI: URLRequestConvertible {
    
    case login([String: Any])
    case refreshToken([String: Any])
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .login,
             .refreshToken:
          return .post
        }
    }
    
    var path: String {
        switch self {
        case .login,
             .refreshToken:
          return "auth/token/"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let urlRequest = self.getURLRequestAndHeadersWith(endpoint: .backend, path, method, ContentType.jsonEncoded, setToken: false)
        
        switch self {
        case .login(let parameters),
             .refreshToken(let parameters):
            return try Alamofire.JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
