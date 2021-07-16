//
//  UIImageView.swift
//  Clean-App
//
//  Created by Rudo on 28/01/2021.
//

import UIKit
import AlamofireImage

extension UIImageView {
 func setURLImage(_ url: String?, completion: ((AFIDataResponse<UIImage>) -> Void)? = nil) {
  if let url = url, let path = URL(string: url) {
   self.af.setImage(withURL: path, completion: completion)
  } else {
    self.image = #imageLiteral(resourceName: "image_placeholder")
  }
 }
}
