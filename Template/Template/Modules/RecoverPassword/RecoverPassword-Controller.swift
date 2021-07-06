//
//  RecoverPassword-Controller.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

class RecoverPasswordViewController: ViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var emailTextField: CustomTextField!
    
  // MARK: - Properties

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    configureTextFields()
  }

  override var navBarTitle: String {
    return "Restablecer contraseña"
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
  }

  func textFieldsHaveErrors() -> Bool {
    var textFieldsHaveErrors = false

    if emailTextField.hasError    { textFieldsHaveErrors = true }

    return textFieldsHaveErrors
  }

  // MARK: - Observers
  @IBAction func recoverButtonPressed(_ sender: UIButton) {
    if textFieldsHaveErrors() { return }
  }

  @IBAction func closeButtonPressed(_ sender: UIButton) {
    dismiss(animated: true)
  }
}
