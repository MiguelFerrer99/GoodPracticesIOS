//
//  Login-Controller.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

class LoginViewController: ViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var emailTextField: CustomTextField!
  @IBOutlet weak var passwordTextField: CustomTextField!
    
  // MARK: - Properties

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    configureTextFields()
  }

  override var navBarTitle: String {
    return "Login"
  }
    
  // MARK: - Functions
  func fillUI() {
    if !isViewLoaded { return }

  }
    
  func configureTextFields() {
    emailTextField.addErrorsToCheck([TextFieldErrorEmptyValue(),
                                     TextFieldErrorEmailFormat()])
    emailTextField.textField.textContentType = .emailAddress
    emailTextField.textField.keyboardType    = .emailAddress

    passwordTextField.addErrorsToCheck([TextFieldErrorEmptyValue(),
                                        TextFieldErrorMinimumCharacters(8)])
    passwordTextField.textField.textContentType = .password

  }

  func textFieldsHaveErrors() -> Bool {
    var textFieldsHaveErrors = false

    if emailTextField.hasError    { textFieldsHaveErrors = true }
    if passwordTextField.hasError { textFieldsHaveErrors = true }

    return textFieldsHaveErrors
  }


  // MARK: - Observers
  @IBAction func loginButtonPressed(_ sender: Any) {
    if textFieldsHaveErrors() { return }
      Cache.set(.logged, true)
      let tabBarVC = UIViewController.instantiate(viewController: TabBarViewController.self)
      let nav = UINavigationController(rootViewController: tabBarVC)
      changeRoot(to: nav)
  }

  @IBAction func recoverPasswordButtonPressed(_ sender: Any) {
      let recoverPasswordVC = UIViewController.instantiate(viewController: RecoverPasswordViewController.self)
      push(viewController: recoverPasswordVC)
  }
}
