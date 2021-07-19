//
//  Strings.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 19/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

protocol Localizable: CustomStringConvertible {
  var rawValue: String { get }
}

extension Localizable {
  var localized: String {
    return NSLocalizedString(self.rawValue, comment: "")
  }

  var uppercased: String {
    return self.localized.uppercased()
  }

  var description: String {
    return self.localized
  }

  func localized(with: CVarArg...) -> String {
    let text = String(format: self.localized, arguments: with)
    return text
  }
}

extension String {

  func localized(_ lang:String?) ->String {

      let path = Bundle.main.path(forResource: lang ?? "en", ofType: "lproj")
      let bundle = Bundle(path: path!)

      return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
  }
}
