//
//  Login-Controller.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

class LoginViewController: ViewController, ViewModelController {
    typealias T = LoginViewModel
    
  // MARK: - IBOutlets
  @IBOutlet weak var emailTextField: CustomTextField!
  @IBOutlet weak var passwordTextField: CustomTextField!
  @IBOutlet weak var loginButton: CustomButton!
    
  // MARK: - Properties
  override var hideNavigationBar: Bool {
    return false
  }
  override var navBarTitle: String {
    return "Login"
  }
  var viewModel: LoginViewModel!

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    setUpUI()
    fillUI()
  }
    
  // MARK: - Functions
  func setUpUI() {
    configureTextFields()
  }
    
  func fillUI() {
    if !isViewLoaded { return }
    emailTextField.textField.text = "miguelferrer@rudo.es"
    passwordTextField.textField.text = "12345678A"
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
      
      loginButton.showLoading()
      
      let email = emailTextField.value
      let password = passwordTextField.value
      
      viewModel.login(username: email, password: password) { result in
          self.loginButton.hideLoading()
          switch result {
          case .success(_):
              let tabBarVC = UIViewController.instantiate(viewController: TabBarViewController.self)
              let nav = UINavigationController(rootViewController: tabBarVC)
              changeRoot(to: nav)
              
          case .failure(_):
              showAlert(title: "Error en Login. Parámetros incorrectos")
          }
      }
  }

  @IBAction func recoverPasswordButtonPressed(_ sender: Any) {
      let recoverPasswordVM = RecoverPasswordViewModel()
      let recoverPasswordVC = UIViewController.instantiate(viewController: RecoverPasswordViewController.self, withViewModel: recoverPasswordVM)
      push(viewController: recoverPasswordVC)
  }
}
