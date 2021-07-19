//
//  ViewController.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

class StartupViewController: ViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var iniciarSesionButton: CustomButton!
  @IBOutlet weak var registarseButton: CustomButton!
  @IBOutlet weak var continuarComoInvitadoButton: UIButton!
  
  // MARK: - Properties
  override var hideNavigationBar: Bool {
    return true
  }

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpUI()
    fillUI()
  }

  // MARK: - Functions
  func setUpUI() {
      iniciarSesionButton.titleLabel?.text = "signin_login_button".localized(Cache.get(stringFor: .language))
      registarseButton.titleLabel?.text = "signin_register_button".localized(Cache.get(stringFor: .language))
      continuarComoInvitadoButton.titleLabel?.text = "signin_guest_button".localized(Cache.get(stringFor: .language))
  }
  
  func fillUI() {
    if !isViewLoaded { return }
  }
  
  override func languageChanged(notification: NSNotification) {
      setUpUI()
      fillUI()
  }

  // MARK: - Observers
  @IBAction func registerButtonPressed(_ sender: Any) {
      let registerVM = RegisterViewModel()
      let registerVC = UIViewController.instantiate(viewController: RegisterViewController.self, withViewModel: registerVM)
      push(viewController: registerVC)
  }
  
  @IBAction func loginButtonPressed(_ sender: Any) {
      let loginVM = LoginViewModel()
      let loginVC = UIViewController.instantiate(viewController: LoginViewController.self, withViewModel: loginVM)
      push(viewController: loginVC) //Como Startup-Controller ya tiene un UINavigationController, solo hay que hacer el push del VC
  }
    
  @IBAction func continuarComoInvitadoButtonPressed(_ sender: Any) {
      let tabBarVC = UIViewController.instantiate(viewController: TabBarViewController.self)
      let nav = UINavigationController(rootViewController: tabBarVC)
      changeRoot(to: nav) //Le pasamos al TabBar un UINavigationController para que pueda usarlo para navegar entre sus ventanas
  }
}
