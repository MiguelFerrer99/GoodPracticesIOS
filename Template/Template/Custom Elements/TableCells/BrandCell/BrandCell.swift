//
//  BrandCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class BrandCell: UITableViewCell, ViewModelCell {
    typealias T = BrandCellViewModel

    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: CustomImageView!
    
    //MARK: - Properties
    var viewModel: BrandCellViewModel! {
        didSet { fillUI() }
    }
    
    //MARK: - Functions
    func fillUI() {
        iconImageView.setURLImage(viewModel.answer.imagePath)
        titleLabel.text = viewModel.answer.text
        if viewModel.isSelected {
            backgroundColor = UIColor(named: "customBlue")
            titleLabel.textColor = .white
            titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        } else {
            backgroundColor = .clear
            titleLabel.textColor = .gray
            titleLabel.font = UIFont.systemFont(ofSize: 14)
        }
    }
}
