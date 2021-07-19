//
//  Attachments-API.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 18/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation
import Alamofire

enum AttachmentsAPI: URLRequestConvertible {

  case getAttachmentDetail(String)

  var method: Alamofire.HTTPMethod {
    switch self {
    case .getAttachmentDetail:
      return .get
    }
  }

  var path: String {
    switch self {
    case .getAttachmentDetail(let id):
      return "attachments/\(id)/"
    }
  }
    
  func asURLRequest() throws -> URLRequest {
    let urlRequest = self.getURLRequestAndHeadersWith(endpoint: .backend, path, method, ContentType.jsonEncoded, setToken: false)

    switch self {
    case .getAttachmentDetail:
      return try Alamofire.JSONEncoding.default.encode(urlRequest)
    }
  }
}
