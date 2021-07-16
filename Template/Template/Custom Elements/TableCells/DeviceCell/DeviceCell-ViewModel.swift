//
//  DeviceCellViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class DeviceCellViewModel: ViewModel {
    
    //MARK: - Properties
    var answer: Answer
    var isSelected: Bool
    
    //MARK: - Initializer
    init(answer: Answer, isSelected:Bool = false) {
        self.answer = answer
        self.isSelected = isSelected
    }
}
