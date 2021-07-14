//
//  EditProfile-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class EditProfileViewController: ViewController, ViewModelController {
    typealias T = EditProfileViewModel
    
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
    var viewModel: EditProfileViewModel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        fillUI()
    }
    
    // MARK: - Functions
    func setUpUI() {
      let save = UIBarButtonItem(title: "Guardar", style: .plain, target: self, action: #selector(saveButtonPressed))

      navigationItem.rightBarButtonItems = [save]
        
      configureTextFields()
    }
    
    func fillUI() {
        nombreTextField.textField.text = viewModel.firstName
        apellidosTextField.textField.text = viewModel.lastName
        emailTextField.textField.text = viewModel.email
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
        let changePassVM = ChangePasswordViewModel()
        let changePassVC = UIViewController.instantiate(viewController: ChangePasswordViewController.self, withViewModel: changePassVM)
        push(viewController: changePassVC)
    }
    
    @objc func saveButtonPressed(sender: Any) {
        if textFieldsHaveErrors() { return }
        
        let firstName = nombreTextField.value
        let lastName = apellidosTextField.value
        let email = emailTextField.value
        
        viewModel.editMe(email: email, firstName: firstName, lastName: lastName) { result in
            switch result {
            case .success(_):
                showAlert(title: "Éxito", message: "Perfil actualizada correctamente")
                self.pop()
                
            case .failure(_): showAlert(title: "Error", message: "Error al actualizar el perfil")
                
            }
        }
    }
}
