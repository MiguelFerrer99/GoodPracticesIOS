//
//  FaqTableCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FaqTableCell: UITableViewCell, ViewModelCell {
    typealias T = FaqTableCellViewModel

    //MARK:- IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    //MARK:- Properties
    var viewModel: FaqTableCellViewModel! {
      didSet { fillUI() }
    }

    //MARK:- Functions
    func fillUI() {
      questionLabel.text = viewModel.faq.question
      answerLabel.text = viewModel.faq.answer
    }
}
