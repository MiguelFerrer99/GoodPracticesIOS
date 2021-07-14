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
    return "https://cleanapp.rudo.es/"
    }
  }
}

/// Defines the ContentTypes
struct ContentType {
  static let urlEncoded  = "application/x-www-form-urlencoded"
  static let jsonEncoded = "application/json"
}

struct APIKeys {
  static let clientID  = "LKIgXHNaJGSIE2Bg0tBSEyVO3HVBTSP72AjE7BrT"
  static let clientSecret = "G8FezB5lWnakaPtKJFKvJFOYT69pZ1That9p5guboGhU3hjPVeNKFlByeykPjJtpuNbDXmhl2cYF6XIHl7P97SN8k7CAZAhe0vI8usx9FkNfTTToKDD2BWUp6s5rr5hC"
}
