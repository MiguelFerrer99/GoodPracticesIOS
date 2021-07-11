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
    
    var fregadoraDevices: [Answer]
    var aspiradoraDevices: [Answer]
    
    var fregadoraDevice1: Answer
    var fregadoraDevice2: Answer
    var aspiradoraDevice1: Answer
    var aspiradoraDevice2: Answer
    
    //MARK: - Initializer
    init(title: String, answers: [Answer], filterIndex: Int) {
        self.answers = answers
        self.title = title
        self.filterIndex = filterIndex
        
        fregadoraDevice1 = Answer(name: "Fregadora 1", image: UIImage(systemName: "1.circle.fill")!)
        fregadoraDevice2 = Answer(name: "Fregadora 2", image: UIImage(systemName: "2.circle.fill")!)
        aspiradoraDevice1 = Answer(name: "Aspiradora 1", image: UIImage(systemName: "1.circle.fill")!)
        aspiradoraDevice2 = Answer(name: "Aspiradora 2", image: UIImage(systemName: "2.circle.fill")!)
        
        fregadoraDevices = [fregadoraDevice1, fregadoraDevice2]
        aspiradoraDevices = [aspiradoraDevice1, aspiradoraDevice2]
    }
    
    //MARK: - Functions
}
