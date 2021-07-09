//
//  FilterAnswersCell-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FilterAnswersCellViewModel: ViewModel {
    //MARK: - Properties
    var answer: Answer
    
    //MARK: - Init
    init(answer: Answer) {
        self.answer = answer
    }
}
