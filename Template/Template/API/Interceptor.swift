//
//  Interceptor.swift
//  OptimusPlan
//
//  Created by David Alhambra on 6/10/20.
//  Copyright © 2020 Rudo. All rights reserved.
//

import Foundation
import Alamofire

enum HTTPHeaderFields: String {
  case authentication  = "Authorization"
  case contentType     = "Content-Type"
  case acceptType      = "Accept"
  case acceptEncoding  = "Accept-Encoding"
  case requestType     = "RequestType"
}

enum RequestType: String{
  case auth
  case usingToken
}

final class RequestInterceptor: Alamofire.RequestInterceptor {

  static var isRefresing = false

  typealias AdapterResult = Swift.Result<URLRequest, Error>

  func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (AdapterResult) -> Void) {
    guard let headerFields = urlRequest.allHTTPHeaderFields, let reqName = headerFields[HTTPHeaderFields.requestType.rawValue] else {
      completion(.success(urlRequest))
      return
    }

    if reqName == RequestType.usingToken.rawValue {
      var urlRequest = urlRequest

      if let accessToken = Cache.get(stringFor: .access_token) {
        urlRequest.headers.add(.authorization(bearerToken: accessToken))
      }

      Log.thisCall(urlRequest)
      completion(.success(urlRequest))
    } else {
      Log.thisCall(urlRequest)
      completion(.success(urlRequest))
    }
  }

  func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
    guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
      return completion(.doNotRetryWithError(error))
    }

    if RequestInterceptor.isRefresing {
      completion(.retryWithDelay(1))
    } else {
      RequestInterceptor.isRefresing = true

// TODO: - Set the refresh token
// Example
//      AuthService().refreshToken { result in
//        switch result {
//        case .success(let token):
//          Cache.set(.refresh_token, token.refreshToken)
//          completion(.retry)
//
//        case .failure(let error):
//          completion(.doNotRetryWithError(error))
//        }
//
//        RequestInterceptor.isRefresing = false
//      }
    }
  }
}
