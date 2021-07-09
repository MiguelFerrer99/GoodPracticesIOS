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
  @IBAction func recoverButtonPressed(_ sender: Any) {
      if textFieldsHaveErrors() { return }
      showAlert(title:"Mail enviado", message: "Nos hemos puesto en contacto contigo para reestablecer tu contraseña.")
  }
}
