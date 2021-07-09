//
//  Profile-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class ProfileViewController: ViewController {

    // MARK: - IBActions
    
    // MARK: - Properties
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    
    // MARK: - Observers
    @IBAction func editarPerfilButtonPressed(_ sender: Any) {
        let editProfileVC = UIViewController.instantiate(viewController: EditProfileViewController.self)
        push(viewController: editProfileVC)
    }
    
    @IBAction func elementosGuardadosButtonPressed(_ sender: Any) {
        //let savedElementsVC = UIViewController.instantiate(viewController: SavedElementsViewController.self)
        //push(viewController: savedElementsVC)
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
        Cache.set(.logged, false)
        let startupVC = UIViewController.instantiate(viewController: StartupViewController.self)
        let nav = UINavigationController(rootViewController: startupVC)
        changeRoot(to: nav)
    }
}
