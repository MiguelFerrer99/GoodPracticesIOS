//
//  OnboardCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 6/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class OnboardCell: UICollectionViewCell, ViewModelCell {
    typealias T = OnboardCellViewModel
    

    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: OnboardCellViewModel! {
      didSet { fillUI() }
    }
    
    // MARK: - Functions
    func fillUI() {
        titleLabel.text = viewModel.onboardScreen.title
        descriptionLabel.text = viewModel.onboardScreen.description
        imageView.image = UIImage(named: viewModel.onboardScreen.image)
    }
}
