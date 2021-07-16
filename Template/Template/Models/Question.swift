//
//  Question.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

class Question {
    
  //MARK: - Properties
  var title: String
  var question: String
  var answers: [Answer]
  var selectedAnswerIndex: Int?
  var childrenQuestions: [Question]
  
  init(title: String, question: String, answers: [Answer] = [], childrenQuestions: [Question] = []){
    self.title = title
    self.question = question
    self.answers = answers
    self.selectedAnswerIndex = nil
    self.childrenQuestions = childrenQuestions
  }
  
  init(title: String, question: String, answers: [Answer] = [], selectedAnswerIndex: Int, childrenQuestions: [Question] = []){
    self.title = title
    self.question = question
    self.answers = answers
    self.selectedAnswerIndex = selectedAnswerIndex
    self.childrenQuestions = childrenQuestions
  }
}
