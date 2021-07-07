//
//  Faq-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FaqViewController: ViewController, ViewModelController {
    typealias T = FaqViewModel

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: FaqViewModel!
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Preguntas frecuentes"
    }
        
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(tableView)
    }
        
    // MARK: - Functions
        
    // MARK: - Observers
}
