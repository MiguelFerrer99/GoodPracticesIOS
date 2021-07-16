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
    @IBOutlet weak var methodologyCellView: CustomView!
    
    //MARK: - Properties
    var viewModel: MethodologyCellViewModel! {
        didSet { fillUI() }
    }
    weak var presenter: Presenter?
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    
        setUpUI()
    }
    
    //MARK: - Functions
    func setUpUI() {
        methodologyCellView.layer.cornerRadius = 10
        methodologyCellView.layer.shadowColor = UIColor.black.cgColor
        methodologyCellView.layer.shadowOpacity = 0.3
        methodologyCellView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        methodologyCellView.layer.shadowRadius = 10
    }
    
    func fillUI() {
        labelName.text = viewModel.methodology.name
        labelSubtitle.text = viewModel.methodology.subtitle
        if viewModel.methodology.isSaved {
            saveMethodologyButton.imageView?.image = UIImage(systemName: "bookmark.fill")
            print("fillUI:isSaved = true")
        } else {
            saveMethodologyButton.imageView?.image = UIImage(systemName: "bookmark")
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
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        let text = "https://cleanapp.rudo.es/methodology/1"

        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.presenter?.present(viewController: activityViewController, completion: nil)
    }
}
