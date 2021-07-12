//
//  HeaderForCollectionSections.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class HeaderForCollectionSections: UICollectionReusableView, ViewModelCell {
    typealias T = HeaderForCollectionSectionsViewModel
    
    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Properties
    var viewModel: HeaderForCollectionSectionsViewModel! {
        didSet {
            fillUI()
        }
    }

    //MARK: - Functions
    func fillUI() {
        titleLabel.text = viewModel.title
    }
}
