//
//  SavedElements-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class SavedElementsViewController: ViewController, ViewModelController {
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
        
        fillUI()
    }
        
    // MARK: - Functions
    func fillUI() {
        if !isViewLoaded { return }
        setUpUI()
    }
    
    func setUpUI() {
        configure(tableView)
    }
        
    // MARK: - Observers
}
