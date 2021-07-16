//
//  FiltersQuestionCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FiltersQuestionCell: UITableViewCell, ViewModelCell {
    typealias T = FiltersQuestionCellViewModel
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    var viewModel: FiltersQuestionCellViewModel! {
        didSet { fillUI() }
    }
    
    func fillUI() {
        questionLabel.text = viewModel.question
        if let device = viewModel.selectedDeviceName {
            answerLabel.text = device
        } else {
            answerLabel.text = viewModel.answer
        }
    }
}
