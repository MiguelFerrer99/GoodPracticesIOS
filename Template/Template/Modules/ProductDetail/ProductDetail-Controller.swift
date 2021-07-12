//
//  ProductDetail-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class ProductDetailViewController: ViewController, ViewModelController {
    typealias T = ProductDetailViewModel
    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Producto"
    }
    var viewModel: ProductDetailViewModel! {
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
        //configure(collectionView)
    }
    
    func setUpUI() {
        var shareButton = UIBarButtonItem()
        shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareButtonPressed))
        shareButton.tintColor = .black

        navigationItem.rightBarButtonItems = [shareButton]
    }
    
    //MARK: - Observers
    @objc func shareButtonPressed(sender: UIButton) {
        let text = "https://cleanapp.rudo.es/methodology/1/products/1"

        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view

        self.present(activityViewController, animated: true, completion: nil)
    }
}
