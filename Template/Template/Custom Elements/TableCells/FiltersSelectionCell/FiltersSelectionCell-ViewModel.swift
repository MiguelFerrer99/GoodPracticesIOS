//
//  FilterAnswersCell-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FiltersSelectionCellViewModel: ViewModel {
    
    //MARK: - Properties
    var answer: Answer
    var isSelected: Bool
    var isClass: Bool
    
    //MARK: - Init
    init(answer: Answer, isSelected: Bool = false, isClass: Bool = false) {
        self.answer = answer
        self.isSelected = isSelected
        self.isClass = isClass
    }
}
