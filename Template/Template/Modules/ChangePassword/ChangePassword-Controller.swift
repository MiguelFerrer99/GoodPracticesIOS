//
//  ChangePassword-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class ChangePasswordViewController: ViewController, ViewModelController {
    typealias T = ChangePasswordViewModel

    // MARK: - IBOutlets
    @IBOutlet weak var contraseñaAntigua: CustomTextField!
    @IBOutlet weak var contraseñaNueva: CustomTextField!
    @IBOutlet weak var contraseñaNuevaRepetida: CustomTextField!
    
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Cambiar contraseña"
    }
    var viewModel: ChangePasswordViewModel!
        
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
      contraseñaNueva.addErrorsToCheck([TextFieldErrorEmptyValue(),
                                          TextFieldErrorMinimumCharacters(8),
                                          TextFieldErrorContainsUpperCase(),
                                          TextFieldErrorContainsNumber(),
                                          TextFieldErrorAreNotEqual(to: contraseñaNuevaRepetida)])
      contraseñaNuevaRepetida.addErrorsToCheck([TextFieldErrorEmptyValue(),
                                          TextFieldErrorMinimumCharacters(8),
                                          TextFieldErrorAreNotEqual(to: contraseñaNueva)])
      contraseñaNueva.textField.textContentType = .newPassword
      contraseñaNuevaRepetida.textField.textContentType = .newPassword
    }
    
    func textFieldsHaveErrors() -> Bool {
      if contraseñaAntigua.hasError
          || contraseñaNueva.hasError
          || contraseñaNuevaRepetida.hasError {
        return true
      }
      return false
    }
        
    // MARK: - Observers
    @objc func saveButtonPressed(sender: Any) {
        guard !textFieldsHaveErrors() else { return }
        let oldPassword = contraseñaAntigua.value
        let newPassword = contraseñaNuevaRepetida.value
        
        viewModel.updatePassword(oldPassword: oldPassword, newPassword: newPassword) { result in
            switch result {
            case .success(_):
                showAlert(title: "Éxito", message: "La contraseña se ha cambiado correctamente") {
                    self.pop()
                }
                
            case .failure(_):
                showAlert(title: "Error", message: "Error en el cambio de contraseña")
            }
        }
    }
}
