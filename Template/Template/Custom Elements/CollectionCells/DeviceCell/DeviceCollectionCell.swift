//
//  DeviceCollectionCell.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class DeviceCollectionCell: UICollectionViewCell, ViewModelCell {
    typealias T = DeviceCollectionCellViewModel
    
    //MARK: - IBOutlets
    @IBOutlet weak var deviceImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
    //MARK: - Properties
    var viewModel: DeviceCollectionCellViewModel! {
      didSet { fillUI() }
    }
    var presenter: Presenter?

    //MARK: - Functions
    func fillUI() {
        deviceImageView.image = viewModel.device.image
        nameLabel.text = viewModel.device.name
        brandLabel.text = viewModel.device.brand.name
    }
    
    //MARK: - Observers
    @IBAction func verButtonPressed(_ sender: Any) {
        let deviceDetailVM = DeviceDetailViewModel(device: viewModel.device)
        let deviceDetailVC = UIViewController.instantiate(viewController: DeviceDetailViewController.self, withViewModel: deviceDetailVM)
        presenter?.push(viewController: deviceDetailVC)
    }
}
