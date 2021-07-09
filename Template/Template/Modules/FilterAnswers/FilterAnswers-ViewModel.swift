//
//  FilterAnswers-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FilterAnswersViewModel: ViewModel {
        
    //MARK: - Properties
    var title: String
    var answers: [Answer]
    var filterIndex: Int
    
    //MARK: - Initializer
    init(title: String, answers: [Answer], filterIndex: Int) {
        self.answers = answers
        self.title = title
        self.filterIndex = filterIndex
    }
    
    //MARK: - Functions
}
