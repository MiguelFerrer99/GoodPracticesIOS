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
  @IBAction func registerButtonPressed(_ sender: UIButton) {
    let registerVC = UIViewController.instantiate(viewController: RegisterViewController.self)
    present(viewController: registerVC)
  }
  
  @IBAction func loginButtonPressed(_ sender: UIButton) {
    let loginVC = UIViewController.instantiate(viewController: LoginViewController.self)
    present(viewController: loginVC)
  }
}
