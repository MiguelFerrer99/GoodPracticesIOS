//
//  Filterr-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FiltersViewController: ViewController, ViewModelController {
    typealias T = FiltersViewModel

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Filtros"
    }
    var viewModel: FiltersViewModel! {
      didSet { fillUI() }
    }
        
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillUI()
    }
    
    // MARK: - Functions
    func setUpUI() {
        let vc = FilterAnswersViewController()
        vc.delegate = self
        configure(tableView)
    }
    
    func fillUI() {
        if !isViewLoaded { return }
        setUpUI()
    }
        
    // MARK: - Observers
    @IBAction func aplicarButtonPressed(_ sender: Any) {
        tabBarController?.selectedIndex = 0
    }
    
    @IBAction func reiniciarFiltrosButtonPressed(_ sender: Any) {
        viewModel.answerNames = ["", "", ""]
        tableView.reloadData()
    }
}
