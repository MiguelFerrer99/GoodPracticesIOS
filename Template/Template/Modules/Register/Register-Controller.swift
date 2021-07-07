//
//  Register-Controller.swift
//  Template
//
//  Created by Toni García Alhambra on 11/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import UIKit

class RegisterViewController: ViewController {
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
  private var policyReaded = false

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    configureTextFields()
  }

  // MARK: - Functions
  func fillUI() {
    if !isViewLoaded { return }

  }
    
  override var navBarTitle: String {
      return "Registro"
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
      if businessName.hasError    { textFieldsHaveErrors = true }

    return textFieldsHaveErrors
  }

  // MARK: - Observers
  @IBAction func registerButtonPressed(_ sender: UIButton) {
    if textFieldsHaveErrors() { return }
    showAlert(title: "Registered successfully", message: "Now you can log in")
  }
    
  @IBAction func personaParticularRadioButtonPressed(_ sender: Any) {
      UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
          self.businessName.isHidden = true
      }, completion: nil)
      empresaRadioButton.backgroundColor = .lightGray
      personaParticularRadioButton.backgroundColor = UIColor(named: "customBlue")
  }
    
  @IBAction func empresaRadioButtonPressed(_ sender: Any) {
      UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
          self.businessName.isHidden = false
      }, completion: nil)
      empresaRadioButton.backgroundColor = UIColor(named: "customBlue")
      personaParticularRadioButton.backgroundColor = .lightGray
  }
    
    @IBAction func politicaPrivacidadButtonPressed(_ sender: Any) {
        if policyReaded {
            imageButtonView.image = UIImage(systemName: "circle")
            policyReaded = false
            registerButton.isEnabled = false
            registerButton.alpha = 0.5
        } else {
            imageButtonView.image = UIImage(systemName: "checkmark.circle.fill")
            policyReaded = true
            registerButton.isEnabled = true
            registerButton.alpha = 1
        }
    }
    
    @IBAction func verPoliticaPrivacidadButtonPressed(_ sender: Any) {
        //let politicaPrivacidadVC = UIViewController.instantiate(viewController: PoliticaPrivacidadViewController.self)
        //let nav = UINavigationController(rootViewController: politicaPrivacidadVC)
        //push(viewController: nav)
        print("ver politica privacidad")
    }
}
