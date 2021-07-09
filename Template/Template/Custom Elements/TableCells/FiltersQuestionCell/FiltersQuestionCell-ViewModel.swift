//
//  FilterQuestionCell-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FiltersQuestionCellViewModel: ViewModel {
    
    //MARK: - Properties
    var question: String
    var selectedAnswer: Answer?
    
    //MARK: - Init
    init(question: String) {
        self.question = question
    }
}
