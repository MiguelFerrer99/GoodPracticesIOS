//
//  EmptyCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class EmptyCell: UITableViewCell, ViewModelCell {
    typealias T = EmptyCellViewModel

    //MARK: - IBOutlets
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    //MARK: - Properties
    var viewModel: EmptyCellViewModel! {
        didSet { fillUI() }
    }
    
    //MARK: - Functions
    func fillUI() {
        messageLabel.text = viewModel.message
        let margins = viewModel.navBarHeight + viewModel.tabBarHeight
        let heightConstraint = cellView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height-margins)
        cellView.addConstraints([heightConstraint])
    }
}
