//
//  FiltersSelection-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FiltersSelectionViewController: ViewController, ViewModelController {
    typealias T = FiltersSelectionViewModel

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    override var navBarTitle: String {
        return viewModel.question.title
    }
    override var hideNavigationBar: Bool {
        return false
    }
    var viewModel: FiltersSelectionViewModel! {
        didSet { fillUI() }
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        fillUI()
    }
    
    //MARK: - Functions
    func setUpUI() {
        configure(tableView)
    }
    
    func fillUI() {
        if !isViewLoaded { return }
    }
}
