//
//  SavedElements-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class SavedElementsViewController: ViewController, ViewModelController, MethodologyCellDelegate {
    
    typealias T = SavedElementsViewModel

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Elementos guardados"
    }
    var viewModel: SavedElementsViewModel! {
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
        viewModel.getSavedMethodologies { result in
            if case .success(_) = result {
                self.viewModel.isLoading = false
                self.tableView.reloadData()
            }
        }
    }
    
    func setUpUI() {
        configure(tableView)
    }
        
    // MARK: - Delegate
    func updateSavedMethodologies(methodologyID: String) {
        viewModel.methodologiesService.saveMethodology(methodologyId: methodologyID) { result in
            if case .success(_) = result {
                if let index = self.viewModel.savedMethodologies.firstIndex(where: { $0.id == methodologyID }) {
                    self.viewModel.savedMethodologies.remove(at: index)
                    NotificationCenter.default.post(name: .SavedMethodologiesChanged, object: nil)
                    self.tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
                }
            } else {
                showAlert(title: "Server error. Try later please")
            }
        }
    }
}
