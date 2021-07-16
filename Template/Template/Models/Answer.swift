//
//  Answer.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class Answer {
    
    //MARK: - Properties
    var text: String
    var imagePath: String
    
    init(text: String, imagePath: String) {
        self.text = text.capitalized
        self.imagePath = imagePath
    }
}
