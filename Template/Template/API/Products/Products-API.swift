//
//  Product-API.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 18/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation
import Alamofire

enum ProductsAPI: URLRequestConvertible {
    
    case getProductDetail(String)

    var method: Alamofire.HTTPMethod {
      switch self {
      case .getProductDetail:
        return .get
      }
    }

    var path: String {
      switch self {
      case .getProductDetail(let id):
        return "products/\(id)/"
      }
    }
    func asURLRequest() throws -> URLRequest {
      let urlRequest = self.getURLRequestAndHeadersWith(endpoint: .backend, path, method, ContentType.jsonEncoded, setToken: false)

      switch self {
      case .getProductDetail:
        return try Alamofire.JSONEncoding.default.encode(urlRequest)
      }
    }
}
