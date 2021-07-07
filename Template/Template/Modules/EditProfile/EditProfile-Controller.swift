//
//  EditProfile-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class EditProfileViewController: ViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var nombreTextField: CustomTextField!
    @IBOutlet weak var apellidosTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Editar perfil"
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    // MARK: - Functions
    func setUpUI() {
      let save = UIBarButtonItem(title: "Guardar", style: .plain, target: self, action: #selector(saveButtonPressed))

      navigationItem.rightBarButtonItems = [save]
        
      configureTextFields()
    }
    
    func configureTextFields() {
        nombreTextField.addErrorsToCheck([TextFieldErrorEmptyValue()])
        nombreTextField.textField.textContentType = .name
        
        apellidosTextField.addErrorsToCheck([TextFieldErrorEmptyValue()])
        apellidosTextField.textField.textContentType = .familyName
        
        emailTextField.addErrorsToCheck([TextFieldErrorEmptyValue(),
                                       TextFieldErrorEmailFormat()])
        emailTextField.textField.textContentType = .emailAddress
        emailTextField.textField.keyboardType    = .emailAddress
    }
    
    func textFieldsHaveErrors() -> Bool {
      var textFieldsHaveErrors = false

      if nombreTextField.hasError     { textFieldsHaveErrors = true }
      if apellidosTextField.hasError { textFieldsHaveErrors = true }
      if emailTextField.hasError    { textFieldsHaveErrors = true }

      return textFieldsHaveErrors
    }
    
    // MARK: - Observers
    @IBAction func cambiarContraseñaButtonPressed(_ sender: Any) {
        let changePassVC = UIViewController.instantiate(viewController: ChangePasswordViewController.self)
        push(viewController: changePassVC)
    }
    
    @objc func saveButtonPressed(sender: UIButton) {
        if textFieldsHaveErrors() { return }
        self.pop()
    }
}
