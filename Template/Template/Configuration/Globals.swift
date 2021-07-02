//
//  Globals.swift
//  Template
//
//  Created by Joel Sifres on 26/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import Foundation

/// Defines the paths to use
enum Endpoint {
  case backend

  var path: String {
    switch self {
    case .backend:
    return "https://translator.rudo.es"
    }
  }
}

/// Defines the ContentTypes
struct ContentType {
  static let urlEncoded  = "application/x-www-form-urlencoded"
  static let jsonEncoded = "application/json"
}
