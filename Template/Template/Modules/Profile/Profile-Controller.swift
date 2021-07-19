//
//  Profile-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class ProfileViewController: ViewController, ViewModelController {
    typealias T = ProfileViewModel

    // MARK: - IBOutlets
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: ProfileViewModel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillUI()
    }
    
    // MARK: - Functions
    func fillUI() {
        viewModel.getMe()
        fullNameLabel.text = viewModel.fullName
        emailLabel.text = viewModel.email
    }
    
    // MARK: - Observers
    @IBAction func editarPerfilButtonPressed(_ sender: Any) {
        let editProfileVM = EditProfileViewModel()
        let editProfileVC = UIViewController.instantiate(viewController: EditProfileViewController.self, withViewModel: editProfileVM)
        push(viewController: editProfileVC)
    }
    
    @IBAction func elementosGuardadosButtonPressed(_ sender: Any) {
        let savedElementsVM = SavedElementsViewModel()
        let savedElementsVC = UIViewController.instantiate(viewController: SavedElementsViewController.self, withViewModel: savedElementsVM)
        push(viewController: savedElementsVC)
    }
    
    @IBAction func cambiarIdiomaButtonPressed(_ sender: Any) {
        let changeLanguageVM = ChangeLanguageViewModel()
        let changeLanguageVC = UIViewController.instantiate(viewController: ChangeLanguageViewController.self, withViewModel: changeLanguageVM)
        push(viewController: changeLanguageVC)
    }
    
    @IBAction func faqButtonPressed(_ sender: Any) {
        let faqVM = FaqViewModel()
        let faqVC = UIViewController.instantiate(viewController: FaqViewController.self, withViewModel: faqVM)
        push(viewController: faqVC)
    }
    
    @IBAction func terminosYcondicionesButtonPressed(_ sender: Any) {
        let termsAndConditionsVC = UIViewController.instantiate(viewController: TermsAndConditionsViewController.self)
        push(viewController: termsAndConditionsVC)
    }
    
    @IBAction func politicaPrivacidadButtonPressed(_ sender: Any) {
        let privacyPolicyVC = UIViewController.instantiate(viewController: PrivacyPolicyViewController.self)
        push(viewController: privacyPolicyVC)
    }
    
    @IBAction func cerrarSesionButtonPressed(_ sender: Any) {
        showLogOutAlert()
    }
}
