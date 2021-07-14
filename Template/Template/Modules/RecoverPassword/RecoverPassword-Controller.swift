//
//  RecoverPassword-Controller.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

class RecoverPasswordViewController: ViewController, ViewModelController {
  typealias T = RecoverPasswordViewModel
    
  // MARK: - IBOutlets
  @IBOutlet weak var emailTextField: CustomTextField!
    
  // MARK: - Properties
    var viewModel: RecoverPasswordViewModel!

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    setUpUI()
    fillUI()
  }

  override var navBarTitle: String {
    return "Restablecer contraseña"
  }
    
  // MARK: - Functions
  func setUpUI() {
    configureTextFields()
  }
    
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
      
      let email = emailTextField.value
      
      viewModel.newPassword(email: email) { result in
          switch result {
          case .success:
              showAlert(title:"Mail enviado", message: "Nos hemos puesto en contacto contigo para reestablecer tu contraseña.")
              self.pop()
              
          case .failure:
              showAlert(title: "Error", message: "Error en la recuperación de contraseña")
          }
      }
  }
}
