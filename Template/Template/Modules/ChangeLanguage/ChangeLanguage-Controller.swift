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
    @IBOutlet weak var spanishLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var spanishView: UIView!
    @IBOutlet weak var englishView: UIView!
    
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
    }
        
    // MARK: - Functions
    func setUpUI() {
        let save = UIBarButtonItem(title: "Guardar", style: .plain, target: self, action: #selector(saveButtonPressed))
        navigationItem.rightBarButtonItems = [save]
        selectedLanguage()
    }
    
    func fillUI() {
        if !isViewLoaded { return }
        selectedLanguage()
    }
    
    func selectedLanguage() {
        spanishLabel.textColor = .lightGray
        spanishView.backgroundColor = .none
        englishLabel.textColor = .lightGray
        englishView.backgroundColor = .none
        
        switch viewModel.selectedLanguage {
            case .spanish:
                spanishLabel.textColor = .white
                spanishView.backgroundColor = UIColor(named: "customBlue")
            case .english:
                englishLabel.textColor = .white
                englishView.backgroundColor = UIColor(named: "customBlue")
        }
    }
        
    // MARK: - Observers
    @IBAction func spanishButtonPressed(_ sender: Any) {
        viewModel.selectedLanguage = .spanish
        selectedLanguage()
    }
    
    @IBAction func englishButtonPressed(_ sender: Any) {
        viewModel.selectedLanguage = .english
        selectedLanguage()
    }
    
    @objc func saveButtonPressed(sender: Any) {
        switch viewModel.selectedLanguage {
            case .spanish:
                Cache.set(.language, "es")
            case .english:
                Cache.set(.language, "en")
        }
        NotificationCenter.default.post(name: .LanguageChanged, object: nil)
        self.pop()
    }
}
