//
//  Register-Controller.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var nameTextField: CustomTextField!
  @IBOutlet weak var lastnameTextField: CustomTextField!
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
    nameTextField.addErrorsToCheck([TextFieldErrorEmptyValue()])
    nameTextField.textField.textContentType = .name

    lastnameTextField.addErrorsToCheck([TextFieldErrorEmptyValue()])
    nameTextField.textField.textContentType = .familyName

    emailTextField.addErrorsToCheck([TextFieldErrorEmptyValue(),
                                     TextFieldErrorEmailFormat()])
    emailTextField.textField.textContentType = .emailAddress
    emailTextField.textField.keyboardType    = .emailAddress

    passwordTextField.addErrorsToCheck([TextFieldErrorEmptyValue(),
                                        TextFieldErrorMinimumCharacters(8)])
    passwordTextField.textField.textContentType = .newPassword
  }

  func textFieldsHaveErrors() -> Bool {
    var textFieldsHaveErrors = false

    if nameTextField.hasError     { textFieldsHaveErrors = true }
    if lastnameTextField.hasError { textFieldsHaveErrors = true }
    if emailTextField.hasError    { textFieldsHaveErrors = true }
    if passwordTextField.hasError { textFieldsHaveErrors = true }

    return textFieldsHaveErrors
  }

  // MARK: - Observers
  @IBAction func registerButtonPressed(_ sender: UIButton) {
    if textFieldsHaveErrors() { return }

  }

  @IBAction func closeButtonPressed(_ sender: UIButton) {
    dismiss(animated: true)
  }
}
