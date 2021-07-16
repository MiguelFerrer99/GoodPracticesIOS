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
    var question, answer: String
    var selectedDeviceName: String?
    
    //MARK: - Init
    init(question: Question, selectedDeviceName: String? = nil) {
        self.question = question.question
        answer = ""
        if let selectedIndex = question.selectedAnswerIndex {
            if (question.childrenQuestions.count > 0), let selectedChildrenIndex = question.childrenQuestions[selectedIndex].selectedAnswerIndex {
              answer = question.childrenQuestions[selectedIndex].answers[selectedChildrenIndex].text
            }
            else {
              answer = question.answers[selectedIndex].text
            }
        }
        self.selectedDeviceName = selectedDeviceName
    }
}
