//
//  Step.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class Step {
    let image: UIImage
    let stepNumber: Int
    let method, specifications, notes, methodology: String
    
    init(image: UIImage, stepNumber: Int, method: String, specifications: String, notes: String, methodology: String) {
        self.image = image
        self.stepNumber = stepNumber
        self.method = method
        self.specifications = specifications
        self.notes = notes
        self.methodology = methodology
    }
}
