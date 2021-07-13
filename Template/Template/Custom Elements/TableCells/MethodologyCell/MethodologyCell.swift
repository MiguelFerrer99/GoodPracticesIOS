//
//  MethodologyCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class MethodologyCell: UITableViewCell, ViewModelCell {
    typealias T = MethodologyCellViewModel
    
    //MARK: - IBOutlets
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var labelShortDescription: UILabel!
    @IBOutlet weak var methodologyImageView: UIImageView!
    @IBOutlet weak var saveMethodologyButton: UIButton!
    
    //MARK: - Properties
    var viewModel: MethodologyCellViewModel! {
        didSet { fillUI() }
    }
    
    //MARK: - Functions
    func fillUI() {
        labelName.text = viewModel.methodology.name
        labelSubtitle.text = viewModel.methodology.subtitle
        if viewModel.methodology.isSaved {
            saveMethodologyButton.imageView?.image = UIImage(systemName: "bookmark.fill")
            print("fillUI:isSaved = true")
        } else {
            saveMethodologyButton.imageView?.image = UIImage(systemName: "bookmark")
            print("fillUI:isSaved = false")
        }
        methodologyImageView.image = viewModel.methodology.image
        labelShortDescription.text = viewModel.methodology.shortDescription
    }
    
    //MARK: - Observers
    @IBAction func saveButtonPressed(_ sender: Any) {
        if Cache.get(boolFor: .logged) {
            if viewModel.methodology.isSaved {
                viewModel.methodology.isSaved = false
                saveMethodologyButton.imageView?.image = UIImage(systemName: "bookmark")
            } else {
                viewModel.methodology.isSaved = true
                saveMethodologyButton.imageView?.image = UIImage(systemName: "bookmark.fill")
            }
        } else {
            showGuestAlert()
        }
    }
}
