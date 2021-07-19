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

    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
    }
    
    //MARK: - Functions
    func setUpUI() {
        methodologyImageView.layer.cornerRadius = 15
    }
    
    func fillUI() {
        labelName.text = viewModel.title
        labelSubtitle.text = viewModel.type
        shortDescriptionLabel.text = viewModel.description
        longDescriptionLabel.text = viewModel.longDescription
        if let image = viewModel.image {
            methodologyImageView.setURLImage(image.midsize)
        }
    }
}
