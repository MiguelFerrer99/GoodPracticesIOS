//
//  Filters-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FiltersViewModel: ViewModel {
    
    //MARK: - Properties
    var filters: [Filter]
    
    var answersFilter1: [Answer]
    var filter1: Filter
    
    var answersFilter2: [Answer]
    var filter2: Filter
    
    var answersFilter3: [Answer]
    var filter3: Filter
    
    var answersFilter4: [Answer]
    var filter4: Filter
    
    var answersFilter5: [Answer]
    var filter5: Filter
    
    var answerNames: [String]
    
    //MARK: - Initialziaer
    init() {
        answersFilter1 = [
            Answer(name: "Baño", image: UIImage(systemName: "1.circle.fill")!),
            Answer(name: "Cocina", image: UIImage(systemName: "2.circle.fill")!)
        ]
        filter1 = Filter(title: "Tipo de trabajo", question: "¿Qué trabajo se va a hacer?", answers: answersFilter1)
        
        answersFilter2 = [
            Answer(name: "Diaria", image: UIImage(systemName: "1.circle.fill")!),
            Answer(name: "Semanal", image: UIImage(systemName: "2.circle.fill")!)
        ]
        filter2 = Filter(title: "Clase de limpieza", question: "¿Qué clase de limpieza?", answers: answersFilter2)
        
        answersFilter3 = [
            Answer(name: "Con aparato", image: UIImage(systemName: "1.circle.fill")!),
            Answer(name: "Manual", image: UIImage(systemName: "2.circle.fill")!)
        ]
        filter3 = Filter(title: "Manual / Aparato", question: "¿Manual o con algún producto?", answers: answersFilter3)
        
        answersFilter4 = [
            Answer(name: "Viper", image: UIImage(systemName: "1.circle.fill")!),
            Answer(name: "Karcher", image: UIImage(systemName: "2.circle.fill")!)
        ]
        filter4 = Filter(title: "Marca", question: "¿Marca del producto?", answers: answersFilter3)
        
        answersFilter5 = [
            Answer(name: "Fregadoras", image: UIImage(systemName: "1.circle.fill")!),
            Answer(name: "Aspiradores Agua-Polvo", image: UIImage(systemName: "2.circle.fill")!)
        ]
        filter5 = Filter(title: "Tipo de aparato", question: "¿Cuál tiene a su disposición?", answers: answersFilter3)
    
        filters = [filter1, filter2, filter3]
        
        answerNames = ["", "", ""]
    }
    
    //MARK: - Functions
}
