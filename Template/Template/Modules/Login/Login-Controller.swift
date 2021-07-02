//
//  Login-Controller.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var emailTextField: CustomTextField!
  @IBOutlet weak var passwordTextField: CustomTextField!

  // MARK: - Properties

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    configureTextFields()
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
  @IBAction func loginButtonPressed(_ sender: UIButton) {
    if textFieldsHaveErrors() { return }

  }

  @IBAction func recoverPasswordButtonPressed(_ sender: UIButton) {
    let recoverPasswordVC = UIViewController.instantiate(viewController: RecoverPasswordViewController.self)
    present(viewController: recoverPasswordVC)
  }

  @IBAction func closeButtonPressed(_ sender: UIButton) {
    dismiss(animated: true)
  }
}
