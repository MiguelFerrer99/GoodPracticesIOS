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
    
  // MARK: - Properties

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: - Functions
  func fillUI() {
    if !isViewLoaded { return }
  }

  // MARK: - Observers
  @IBAction func registerButtonPressed(_ sender: Any) {
      let registerVM = RegisterViewModel()
      let registerVC = UIViewController.instantiate(viewController: RegisterViewController.self, withViewModel: registerVM)
      push(viewController: registerVC)
  }
  
  @IBAction func loginButtonPressed(_ sender: Any) {
      Cache.set(.logged, true)
      let loginVC = UIViewController.instantiate(viewController: LoginViewController.self)
      push(viewController: loginVC) //Como Startup-Controller ya tiene un UINavigationController, solo hay que hacer el push del VC
  }
    
  @IBAction func continuarComoInvitadoButtonPressed(_ sender: Any) {
      let tabBarVC = UIViewController.instantiate(viewController: TabBarViewController.self)
      let nav = UINavigationController(rootViewController: tabBarVC)
      changeRoot(to: nav) //Le pasamos al TabBar un UINavigationController para que pueda usarlo para navegar entre sus ventanas
  }
}
