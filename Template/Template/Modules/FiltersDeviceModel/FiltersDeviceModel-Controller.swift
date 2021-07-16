//
//  FiltersDeviceModel-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FiltersDeviceModelViewController: ViewController, ViewModelController {
    typealias T = FiltersDeviceViewModel

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var viewModel: FiltersDeviceViewModel! {
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
        
        viewModel.getDevices { result in
            if case .success(_) = result {
                self.tableView.reloadData()
            }
        }
    }
}
