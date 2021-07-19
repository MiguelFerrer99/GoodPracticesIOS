//
//  Home-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class HomeViewController: ViewController, ViewModelController, MethodologyCellDelegate {
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
        fillUI()
    }
        
    // MARK: - Functions
    func fillUI() {
        if !isViewLoaded { return }
        
        viewModel.getMethodologies { result in
            self.viewModel.isLoading = false
        }
      
        viewModel._searchParameters.bindAndFire { [weak self] _ in
            //Comprobación de que estamos en Home (con "guard", self se puede utilizar fuera)
            guard let self = self else { return }
            self.viewModel.isLoading = true
            self.viewModel.methods = []
            self.viewModel.getMethodologies { _ in
                self.viewModel.isLoading = false
            }
        }
        
        viewModel._needsToReload.bindAndFire { [weak self] _ in
            //Comprobación de que estamos en Home (con "guard", self se puede utilizar fuera)
          guard let self = self, self.viewModel.needsToReload else { return }

          self.viewModel.isLoading = true
          self.viewModel.methods = []
          self.viewModel.getMethodologies { _ in
            self.viewModel.isLoading = false
          }
          self.viewModel.needsToReload = false
        }

        viewModel._methods.bind { [weak self] _ in
          //Comprobación de que estamos en Home (con "guard", self se puede utilizar fuera)
          guard let self = self else { return }
          self.tableView.reloadData()
        }
    }
    
    func setUpUI() {
        configure(tableView)
        configureSearchBar()
        
        var savedButton = UIBarButtonItem()
        savedButton = UIBarButtonItem(image: UIImage(systemName: "book"), style: .plain, target: self, action: #selector(savedButtonPressed))
        savedButton.tintColor = .black

        navigationItem.rightBarButtonItem = savedButton
    }
        
    // MARK: - Delegate
    func updateSavedMethodologies(methodologyID: String) {
      viewModel.methodologiesService.saveMethodology(methodologyId: methodologyID) { result in
        switch result {
        case .success(_):
            self.tableView.reloadData()
          
        case .failure(_):
          if let index = self.viewModel.methods.firstIndex(where: { $0.id == methodologyID }) {
            let items = self.viewModel.methods
            if items[index].isSaved {
                showAlert(title: "Error al guardar método")
            }
          }
        }
      }
    }
    
    // MARK: - Observers
    @objc func savedButtonPressed(sender: UIButton) {
        if User.isLogged {
            let savedElementsVM = SavedElementsViewModel()
            let savedElementsVC = UIViewController.instantiate(viewController: SavedElementsViewController.self, withViewModel: savedElementsVM)
            push(viewController: savedElementsVC)
        } else {
            showGuestAlert()
        }
    }
}
