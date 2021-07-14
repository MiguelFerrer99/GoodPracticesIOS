//
//  Users-API.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 14/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation
import Alamofire

enum UsersAPI: URLRequestConvertible {
    
    case register([String: Any])
    case updatePassword([String: Any])
    case getMe
    case editMe(String, [String: Any])
    case newPassword([String: Any])
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .register,
             .updatePassword,
             .newPassword:
          return .post
        
        case .getMe:
          return .get
            
        case .editMe:
          return .put
        }
    }
    
    var path: String {
        switch self {
            case .register:             return "users/"
            case .updatePassword:       return "users/password/"
            case .getMe:                return "users/me/"
            case .newPassword:          return "users/new_password/"
            case .editMe(let id, _):    return "users/\(id)/"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
      let urlRequestWithoutHeader = self.getURLRequestAndHeadersWith(endpoint: .backend, path, method, ContentType.jsonEncoded, setToken: false)
      let urlRequest = self.getURLRequestAndHeadersWith(endpoint: .backend, path, method, ContentType.jsonEncoded, setToken: true)

      switch self {
      case .register(let parameters),
           .newPassword(let parameters):
        return try Alamofire.JSONEncoding.default.encode(urlRequestWithoutHeader, with: parameters)
        
      case .updatePassword(let parameters),
           .editMe(_, let parameters):
        return try Alamofire.JSONEncoding.default.encode(urlRequest, with: parameters)
        
      case .getMe:
        return try Alamofire.JSONEncoding.default.encode(urlRequest)
      }
    }
}
