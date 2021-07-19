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
  @IBOutlet weak var passwordTipLabel: UILabel!
  @IBOutlet weak var comoIdentificamosLabel: UILabel!
  @IBOutlet weak var heLeidoLabel: UILabel!
  @IBOutlet weak var politicaPrivacidadButton: UIButton!
  
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
      
      self.title = "register_toolbar".localized(Cache.get(stringFor: .language))
      nameTextField.textField.placeholder = "register_name_hint".localized(Cache.get(stringFor: .language))
      lastnameTextField.textField.placeholder = "register_surname_hint".localized(Cache.get(stringFor: .language))
      emailTextField.textField.placeholder = "register_email_hint".localized(Cache.get(stringFor: .language))
      passwordTextField.textField.placeholder = "register_password_hint".localized(Cache.get(stringFor: .language))
      businessName.textField.placeholder = "register_company_hint".localized(Cache.get(stringFor: .language))
      personaParticularRadioButton.titleLabel?.text = "register_radio_one".localized(Cache.get(stringFor: .language))
      empresaRadioButton.titleLabel?.text = "register_radio_two".localized(Cache.get(stringFor: .language))
      registerButton.titleLabel?.text = "register_button".localized(Cache.get(stringFor: .language))
      passwordTipLabel.text = "register_password_requirements".localized(Cache.get(stringFor: .language))
      comoIdentificamosLabel.text = "register_radio_title".localized(Cache.get(stringFor: .language))
      heLeidoLabel.text = "register_privacy_policy".localized(Cache.get(stringFor: .language))
      politicaPrivacidadButton.titleLabel?.text = "register_privacy_policy_span".localized(Cache.get(stringFor: .language))
    
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
    
  override func languageChanged(notification: NSNotification) {
    setUpUI()
  }
  
  func configureTextFields() {
    nameTextField.addErrorsToCheck([TextFieldErrorEmptyValue()])
    nameTextField.textField.textContentType = .name
    nameTextField.textField.autocorrectionType = .no

    lastnameTextField.addErrorsToCheck([TextFieldErrorEmptyValue()])
    lastnameTextField.textField.textContentType = .familyName
    lastnameTextField.textField.autocorrectionType = .no

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
      
      let email = emailTextField.value
      let password = passwordTextField.value
      let name = nameTextField.value
      let lastName = lastnameTextField.value
      let companyName = businessName.value
      
      viewModel.register(email: email, password: password, firstName: name, lastName: lastName, isBusiness: viewModel.isCompany, businessName: companyName) { result in
          switch result {
          case .success(let user):
              showAlert(title: "Registered successfully", message: "Now you can log in") {
                  self.viewModel.login(username: user.email, password: password) { result in
                      switch result {
                      case .success(_):
                          let tabBarVC = UIViewController.instantiate(viewController: TabBarViewController.self)
                          let nav = UINavigationController(rootViewController: tabBarVC)
                          changeRoot(to: nav)
                          
                      case .failure(_):
                          showAlert(title: "Error en login. Parámetros incorrectos")
                      }
                  }
              }
              
          case .failure(_):
              showAlert(title: "Error", message: "Error en el registro", completion: nil)
          }
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
