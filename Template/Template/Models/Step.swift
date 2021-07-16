//
//  Step.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class Step: Codable {

    private enum CodingKeys: String, CodingKey {
      case id, image, method, specifications, notes, methodology
      case stepNumber = "step_number"
    }

    //MARK: - Properties
    let id: String
    let image: Image?
    let method, specifications, notes, methodology: String?
    let stepNumber: Int
}
