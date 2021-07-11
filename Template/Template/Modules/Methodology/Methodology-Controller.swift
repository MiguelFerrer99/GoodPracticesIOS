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
        
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Cambiar idioma"
    }
    var viewModel: MethodologyViewModel! {
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
        
    }
        
    // MARK: - Observers
}
