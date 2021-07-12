//
//  MethodologyHeaderCollectionCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class MethodologyHeaderCollectionCell: UICollectionViewCell, ViewModelCell {
    typealias T = MethodologyHeaderCollectionCellViewModel

    //MARK: - IBOutlets
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var methodologyImageView: UIImageView!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var longDescriptionLabel: UILabel!
    
    //MARK: - Properties
    var viewModel: MethodologyHeaderCollectionCellViewModel! {
      didSet { fillUI() }
    }

    //MARK: - Functions
    func fillUI() {
        labelName.text = viewModel.name
        labelSubtitle.text = viewModel.subtitle
        methodologyImageView.image = viewModel.image
        shortDescriptionLabel.text = viewModel.shortDescription
        longDescriptionLabel.text = viewModel.longDescription
    }

    //MARK: - Observers
}
