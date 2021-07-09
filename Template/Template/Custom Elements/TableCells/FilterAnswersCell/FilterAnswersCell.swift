//
//  FilterAnswersCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FilterAnswersCell: UITableViewCell, ViewModelCell {
    typealias T = FilterAnswersCellViewModel
    
    //MARK: - IBOutlets
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerImageView: UIImageView!
    @IBOutlet weak var answerView: UIView!
    
    //MARK: - Properties
    var viewModel: FilterAnswersCellViewModel! {
        didSet { fillUI() }
    }
    
    //MARK: - Functions
    func fillUI() {
        answerLabel.text = viewModel.answer.name
        answerImageView.image = viewModel.answer.image
    }
    
    //MARK: - Observers
}
