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
    @IBOutlet weak var cellView: CustomView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    //MARK: - Properties
    var viewModel: ProductCollectionCellViewModel! {
      didSet { fillUI() }
    }

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        setUpUI()
    }
    
    //MARK: - Functions
    func setUpUI() {
        cellView.layer.cornerRadius = 8
        cellView.layer.shadowColor = UIColor.black.cgColor
        cellView.layer.shadowOpacity = 0.2
        cellView.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        cellView.layer.shadowRadius = 8
    }
    
    func fillUI() {
        labelName.text = viewModel.product.name
        productImageView.image = viewModel.product.image
    }
    
    //MARK: - Observers
}
