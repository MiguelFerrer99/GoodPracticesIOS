//
//  UIColor.swift
//  OptimusPlan
//
//  Created by David Alhambra on 7/10/20.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(hex: String, alpha: CGFloat = 1.0) {
    var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

    if hexFormatted.hasPrefix("#") {
      hexFormatted = String(hexFormatted.dropFirst())
    }

    var rgbValue: UInt64 = 0
    Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }
}
