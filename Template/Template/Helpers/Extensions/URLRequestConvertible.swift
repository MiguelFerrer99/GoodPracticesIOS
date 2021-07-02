//
//  URLRequestConvertible.swift
//  GoodPractices
//
//  Created by Joel Sifres on 16/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import Alamofire

extension URLRequestConvertible {
  static var contentType:  String  {
    return "application/json"
  }

  func getURLRequestAndHeadersWith(endpoint: Endpoint, _ path: String, _ method : Alamofire.HTTPMethod, _ contentType: String = contentType, setToken: Bool) -> URLRequest {

    guard let url = URL(string: endpoint.path)?.appendingPathComponent(path) else {
      Log.this(path, type: .error)

      fatalError()
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    urlRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")

    urlRequest.setValue(setToken ? RequestType.usingToken.rawValue : RequestType.auth.rawValue,
                        forHTTPHeaderField: HTTPHeaderFields.requestType.rawValue)

    return urlRequest
  }
}
