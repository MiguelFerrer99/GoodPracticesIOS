//
//  MethodologyCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

protocol ReloadTableViewDelegate {
    func reloadTableView(methodologyIndex: Int)
}

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
    var delegate: ReloadTableViewDelegate?
    
    //MARK: - Functions
    func fillUI() {
        labelName.text = viewModel.methodology.name
        labelSubtitle.text = viewModel.methodology.subtitle
        if viewModel.methodology.isSaved {
            saveMethodologyButton.imageView?.image = UIImage(systemName: "bookmark.fill")
        }
        methodologyImageView.image = viewModel.methodology.image
        labelShortDescription.text = viewModel.methodology.shortDescription
    }
    
    //MARK: - Observers
    @IBAction func saveButtonPressed(_ sender: Any) {
        if viewModel.methodology.isSaved {
            saveMethodologyButton.imageView?.image = UIImage(systemName: "bookmark")
            viewModel.methodology.isSaved = false
        } else {
            saveMethodologyButton.imageView?.image = UIImage(systemName: "bookmark.fill")
            viewModel.methodology.isSaved = true
        }
        delegate?.reloadTableView(methodologyIndex: viewModel.methodology.index)
    }
}
