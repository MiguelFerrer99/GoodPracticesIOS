//
//  FiltersSelectionCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FiltersSelectionCell: UITableViewCell, ViewModelCell {
    typealias T = FiltersSelectionCellViewModel
    
    //MARK: - IBOutlets
    @IBOutlet weak var shadowLayerView: UIView!
    @IBOutlet weak var backgroundLayerView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: CustomImageView!
    
    //MARK: - Properties
    var viewModel: FiltersSelectionCellViewModel! {
        didSet { fillUI() }
    }
    
    //MARK: - Functions
    func fillUI() {
        if viewModel.isClass {
            iconImageView.image = UIImage(named: viewModel.answer.imagePath)
            setCellColors()
        } else {
            iconImageView.setURLImage(viewModel.answer.imagePath) { image in
                self.setCellColors()
            }
        }
    }
    
    //MARK: - Observers
    func setCellColors() {
      if viewModel.isSelected {
        backgroundColor = UIColor(named: "customBlue")
        iconImageView.color = .white
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
      } else {
        backgroundColor = .clear
        iconImageView.color = UIColor(named: "customBlue")!
        titleLabel.textColor = .gray
        titleLabel.font = UIFont.systemFont(ofSize: 14)
      }
    }
    
    //MARK: - Observers
}
