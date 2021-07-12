//
//  StepCollectionCellViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class StepCollectionCellViewModel: ViewModel {
    
    //MARK: - Properties
    var step: Step
    var totalSteps, actualStep: Int
    
    //MARK: - Initializer
    init(step: Step, totalSteps: Int, actualStep: Int) {
        self.step = step
        self.totalSteps = totalSteps
        self.actualStep = actualStep
    }
    
    //MARK: - Functions
}
