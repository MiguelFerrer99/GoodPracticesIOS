//
//  ChangeLanguage-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class ChangeLanguageViewController: ViewController, ViewModelController {
    typealias T = ChangeLanguageViewModel

    // MARK: - IBOutlets
        
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Cambiar idioma"
    }
    var viewModel: ChangeLanguageViewModel! {
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
        
    }
    
    func setUpUI() {
        
    }
        
    // MARK: - Observers
}
