//
//  Filter.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class Filter {
    let title: String
    let question: String
    let answers: [Answer]
    let selectedAnswerIndex: Int
    
    init(title: String, question: String, answers: [Answer]) {
        self.title = title
        self.question = question
        self.answers = answers
        self.selectedAnswerIndex = -1
    }
}
