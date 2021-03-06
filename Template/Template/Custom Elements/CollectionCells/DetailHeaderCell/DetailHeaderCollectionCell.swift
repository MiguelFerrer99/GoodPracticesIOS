//
//  DetailHeaderCollectionCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 13/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class DetailHeaderCollectionCell: UICollectionViewCell, ViewModelCell {
    typealias T = DetailHeaderCollectionCellViewModel

    //MARK: - IBOutlets
    @IBOutlet weak var detailHeaderCollectionImageView: UIImageView!
    @IBOutlet weak var shortDescription: UILabel!
    @IBOutlet weak var longDescription: UILabel!
    
    //MARK: - Properties
    var viewModel: DetailHeaderCollectionCellViewModel! {
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
        detailHeaderCollectionImageView.layer.cornerRadius = 10
    }
    
    func fillUI() {
        if let image = viewModel.image {
            detailHeaderCollectionImageView.setURLImage(image.midsize)
        }
        shortDescription.text = viewModel.shortDescription
        longDescription.text = viewModel.longDescription
    }

    //MARK: - Observers
    @IBAction func buyButtonPressed(_ sender: Any) {
        print("Redirecting to online store...")
        /*if let url = URL(string: viewModel.url){
            let safariViewController = SFSafariViewController(url: url)
            presenter?.present(viewController: safariViewController, completion: nil)
        }*/
    }
}
