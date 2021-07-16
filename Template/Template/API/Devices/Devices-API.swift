//
//  Devices-API.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation
import Alamofire

enum DevicesAPI: URLRequestConvertible {
    
    case getDeviceDetail(String)
    case getBrands
    case getDevices([String: Any])
    case getItemTypes
    
    var method: Alamofire.HTTPMethod {
      switch self {
      case .getDeviceDetail, .getBrands, .getDevices, .getItemTypes:
        return .get
      }
    }
    
    var path: String {
      switch self {
      case .getDeviceDetail(let id):
        return "devices/\(id)/"

      case .getBrands:
        return "brands/"

      case .getDevices:
        return "devices/"

      case .getItemTypes:
        return "devices/types/"
      }
    }
    
    func asURLRequest() throws -> URLRequest {
      let urlRequest = self.getURLRequestAndHeadersWith(endpoint: .backend, path, method, ContentType.jsonEncoded, setToken: false)

      switch self {
      case .getDeviceDetail, .getBrands, .getItemTypes:
        return try Alamofire.JSONEncoding.default.encode(urlRequest)

      case .getDevices(let parameters):
        return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
      }
    }
}
