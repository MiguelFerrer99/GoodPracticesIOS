//
//  ProductCollectionCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class ProductCollectionCell: UICollectionViewCell, ViewModelCell {
    typealias T = ProductCollectionCellViewModel
    
    //MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    //MARK: - Properties
    var viewModel: ProductCollectionCellViewModel! {
      didSet { fillUI() }
    }

    //MARK: - Functions
    func fillUI() {
        labelName.text = viewModel.product.name
        productImageView.image = viewModel.product.image
    }
    
    //MARK: - Observers
}
