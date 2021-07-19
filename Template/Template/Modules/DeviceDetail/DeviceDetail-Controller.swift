//
//  DeviceDetail-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class DeviceDetailViewController: ViewController, ViewModelController {
    typealias T = DeviceDetailViewModel
    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Aparato"
    }
    var viewModel: DeviceDetailViewModel! {
      didSet { fillUI() }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        fillUI()
    }
    
    //MARK: - Functions
    func fillUI() {
        if !isViewLoaded { return }
        
        viewModel.getDeviceDetail { result in
          if case .success(let deviceDetail) = result {
            if let products = deviceDetail.products, products.count > 0{
                self.viewModel.collectionManager.addProductsSection(products: products)
            }
            if let devices = deviceDetail.attachments, devices.count > 0 {
                self.viewModel.collectionManager.addDevicesSection(devices: devices)
            }
            self.collectionView.reloadData()
          }
        }
    }
    
    func setUpUI() {
        configure(collectionView)
        
        var shareButton = UIBarButtonItem()
        shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareButtonPressed))
        shareButton.tintColor = .black

        navigationItem.rightBarButtonItems = [shareButton]
    }
    
    //MARK: - Observers
    @objc func shareButtonPressed(sender: UIButton) {
        guard let id = viewModel.deviceDetail?.id else { return }
        let text = "https://cleanapp.rudo.es/device/\(id)"

        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view

        self.present(activityViewController, animated: true, completion: nil)
    }
}
