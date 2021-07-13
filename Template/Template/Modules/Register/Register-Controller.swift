//
//  Register-Controller.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

class RegisterViewController: ViewController, ViewModelController {
    typealias T = RegisterViewModel
    
  // MARK: - IBOutlets
  @IBOutlet weak var nameTextField: CustomTextField!
  @IBOutlet weak var lastnameTextField: CustomTextField!
  @IBOutlet weak var emailTextField: CustomTextField!
  @IBOutlet weak var passwordTextField: CustomTextField!
  @IBOutlet weak var businessName: CustomTextField!
  @IBOutlet weak var personaParticularRadioButton: CustomButton!
  @IBOutlet weak var empresaRadioButton: CustomButton!
  @IBOutlet weak var imageButtonView: UIImageView!
  @IBOutlet weak var registerButton: CustomButton!
    
  // MARK: - Properties
  override var hideNavigationBar: Bool {
    return false
  }
  override var navBarTitle: String {
    return "Registro"
  }
  var viewModel: RegisterViewModel! {
    didSet { fillUI() }
  }
  private var policyReaded = false

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    setUpUI()
    fillUI()
  }

  // MARK: - Functions
  func setUpUI() {
      configureTextFields()
      
      viewModel._isTermsChecked.bindAndFire { [weak self] isTermsChecked in
          self?.imageButtonView.image = isTermsChecked ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
          self?.registerButton.isEnabled = isTermsChecked
          self?.registerButton.alpha = isTermsChecked ? 1 : 0.5
      }
      
      viewModel._isCompany.bindAndFire { [weak self] isCompany in
          self?.empresaRadioButton.backgroundColor = isCompany ? UIColor(named: "customBlue") : .lightGray
          self?.personaParticularRadioButton.backgroundColor = !isCompany ? UIColor(named: "customBlue") : .lightGray
          self?.businessName.isHidden = isCompany ? false : true
      }
  }
    
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
      
    businessName.addErrorsToCheck([TextFieldErrorEmptyValue()])
    businessName.textField.textContentType = .name
  }

  func textFieldsHaveErrors() -> Bool {
    var textFieldsHaveErrors = false

    if nameTextField.hasError     { textFieldsHaveErrors = true }
    if lastnameTextField.hasError { textFieldsHaveErrors = true }
    if emailTextField.hasError    { textFieldsHaveErrors = true }
    if passwordTextField.hasError { textFieldsHaveErrors = true }
    if businessName.hasError      { textFieldsHaveErrors = true }

    return textFieldsHaveErrors
  }

  // MARK: - Observers
  @IBAction func registerButtonPressed(_ sender: Any) {
    if textFieldsHaveErrors() { return }
      showAlert(title: "Registered successfully", message: "Now you can log in") {
          Cache.set(.logged, true)
          let tabBarVC = UIViewController.instantiate(viewController: TabBarViewController.self)
          let nav = UINavigationController(rootViewController: tabBarVC)
          changeRoot(to: nav)
      }
  }
    
  @IBAction func personaParticularRadioButtonPressed(_ sender: Any) {
      viewModel.isCompany = false
  }
    
  @IBAction func empresaRadioButtonPressed(_ sender: Any) {
      viewModel.isCompany = true
  }
    
    @IBAction func politicaPrivacidadButtonPressed(_ sender: Any) {
        viewModel.isTermsChecked.toggle()
    }
    
    @IBAction func verPoliticaPrivacidadButtonPressed(_ sender: Any) {
        let politicaPrivacidadVC = UIViewController.instantiate(viewController: PrivacyPolicyViewController.self)
        push(viewController: politicaPrivacidadVC)
    }
}
