//
//  Generic-API.swift
//  GoodPractices
//
//  Created by Joel Sifres on 26/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import Foundation
import Alamofire

enum GenericAPI: URLRequestConvertible {
  
  case update_required([String: Any])
  
  var method: Alamofire.HTTPMethod {
    switch self {
    case .update_required:
      return .post
    }
  }
  
  var path: String {
    switch self {
    case .update_required:
      return "/configs/update_required/"
    }
  }
  func asURLRequest() throws -> URLRequest {
    let urlRequest = self.getURLRequestAndHeadersWith(endpoint: .backend, path, method, ContentType.jsonEncoded, setToken: false)
    
    switch self {
    case .update_required(let parameters):
      return try Alamofire.JSONEncoding.default.encode(urlRequest, with: parameters)
    }
  }
}
