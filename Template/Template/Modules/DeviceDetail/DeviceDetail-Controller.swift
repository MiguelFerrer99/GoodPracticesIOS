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
        
        fillUI()
    }
    
    //MARK: - Functions
    func fillUI() {
        if !isViewLoaded { return }
        setUpUI()
        configure(collectionView)
        
        let products = viewModel.device.products
        let devices = viewModel.device.attachments
        viewModel.collectionManager.addProductsSection(products: products)
        viewModel.collectionManager.addDevicesSection(devices: devices)
    }
    
    func setUpUI() {
        var shareButton = UIBarButtonItem()
        shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareButtonPressed))
        shareButton.tintColor = .black

        navigationItem.rightBarButtonItems = [shareButton]
    }
    
    //MARK: - Observers
    @objc func shareButtonPressed(sender: UIButton) {
        let text = "https://cleanapp.rudo.es/methodology/1/devices/1"

        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view

        self.present(activityViewController, animated: true, completion: nil)
    }
}
