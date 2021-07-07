//
//  FaqTableCell-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FaqTableCellViewModel: ViewModel {
  var faq: FAQ

  init(faq: FAQ) {
    self.faq = faq
  }
}
