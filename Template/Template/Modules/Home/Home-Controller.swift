//
//  Home-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class HomeViewController: ViewController, ViewModelController {
    typealias T = HomeViewModel

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Inicio"
    }
    var viewModel: HomeViewModel! {
      didSet { fillUI() }
    }
        
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
        
    // MARK: - Functions
    func fillUI() {
        if !isViewLoaded { return }
        setUpUI()
    }
    
    func setUpUI() {
        configure(tableView)
        configureSearchBar()
        
        var savedButton = UIBarButtonItem()
        savedButton = UIBarButtonItem(image: UIImage(systemName: "book"), style: .plain, target: self, action: #selector(savedButtonPressed))
        savedButton.tintColor = #colorLiteral(red: 0, green: 0.05099999905, blue: 0.1490000039, alpha: 1)

        navigationItem.rightBarButtonItem = savedButton
    }
        
    // MARK: - Observers
    @objc func savedButtonPressed(sender: UIButton) {
        let savedElementsVM = SavedElementsViewModel()
        let savedElementsVC = UIViewController.instantiate(viewController: SavedElementsViewController.self, withViewModel: savedElementsVM)
        push(viewController: savedElementsVC)
    }
}
