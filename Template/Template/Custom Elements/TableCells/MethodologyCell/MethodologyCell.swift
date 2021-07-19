//
//  MethodologyCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

protocol MethodologyCellDelegate: AnyObject {
  func updateSavedMethodologies(methodologyID: String)
}

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
    weak var delegate: MethodologyCellDelegate?
    
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
        if let image = viewModel.methodology.image {
            methodologyImageView.setURLImage(image.midsize)
        }
        labelShortDescription.text = viewModel.methodology.shortDescription
        checkSaved()
    }
    
    func checkSaved() {
        let resetIcon = self.viewModel.methodology.isSaved ? "bookmark.fill" : "bookmark"
        saveMethodologyButton.setImage(UIImage(systemName: resetIcon), for: .normal)
    }
    
    //MARK: - Observers
    @IBAction func saveButtonPressed(_ sender: Any) {
        if User.isLogged {
            viewModel.methodology.isSaved.toggle()
            checkSaved()
            delegate?.updateSavedMethodologies(methodologyID: viewModel.methodology.id)
        } else {
            showGuestAlert()
        }
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        let text = "https://cleanapp.rudo.es/methodology/\(viewModel.methodology.id)"

        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.presenter?.present(viewController: activityViewController, completion: nil)
    }
}
