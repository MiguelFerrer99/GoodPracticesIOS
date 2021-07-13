//
//  Metodology-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class MethodologyViewController: ViewController, ViewModelController {
    typealias T = MethodologyViewModel

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Metodología"
    }
    var viewModel: MethodologyViewModel! {
      didSet { fillUI() }
    }
    static let sectionHeaderElementKind = "section-header-element-kind"
    var saveButton = UIBarButtonItem()
        
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillUI()
    }
        
    // MARK: - Functions
    func fillUI() {
        if !isViewLoaded { return }
        setUpUI()
        configure(collectionView)
        
        let products = viewModel.methodology.products
        let devices = viewModel.methodology.devices
        let steps = viewModel.methodology.steps
        viewModel.collectionManager.updateCollectionSections(products: products, devices: devices, steps: steps)
    }
    
    func setUpUI() {
        let savedIcon = viewModel.methodology.isSaved ? "bookmark.fill" : "bookmark"

        saveButton = UIBarButtonItem(image: UIImage(systemName: savedIcon), style: .plain, target: self, action: #selector(saveButtonPressed))
        saveButton.tintColor = .black

        var shareButton = UIBarButtonItem()
        shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareButtonPressed))
        shareButton.tintColor = .black

        navigationItem.rightBarButtonItems = [shareButton, saveButton]
    }
        
    // MARK: - Observers
    @objc func saveButtonPressed(sender: UIButton) {
        if Cache.get(boolFor: .logged) {
            if viewModel.methodology.isSaved {
                viewModel.methodology.isSaved = false
                saveButton.image = UIImage(systemName: "bookmark")
            } else  {
                viewModel.methodology.isSaved = true
                saveButton.image = UIImage(systemName: "bookmark.fill")
            }
        } else {
            showGuestAlert()
        }
    }
    
    @objc func shareButtonPressed(sender: UIButton) {
        let text = "https://cleanapp.rudo.es/methodology/1"

        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view

        self.present(activityViewController, animated: true, completion: nil)
    }
}
