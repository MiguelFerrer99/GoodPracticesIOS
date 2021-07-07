//
//  PrivacyPolicy-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class PrivacyPolicyViewController: ViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Política de privacidad"
    }
        
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
        
    // MARK: - Functions
    func setUpUI() {
        label1.text = "Al crear una cuenta y utilizar este servicio, usted acepta y accede a estar obligado por la política de privacidad de este acuerdo. Los usuarios tanto Empresas como personas privadas o profesionales de la limpieza que se registren aceptan que CleanApp guarde su información personal. Las informaciones que se guardan son Nombre i/o nombre de empresa, Apellido, Mail y código de la cuenta. La información esta guardado y protegido en la base de datos que solamente el administrador de CleanApp tiene acceso. CleanApp no vende, no comparte y no difunde información personal a terceros o al público en general."
        label2.text = "El usuario puede modificar en cualquier momento sus datos personales en su perfil de CleanApp."
        label3.text = "Si hay algún cambio en nuestra política de privacidad, anunciaremos por correo electrónico que se han hecho tales cambios. Si hay algún cambio en nuestra aplicación CleanApp respecto a la manera en que usamos la información de identificación personal de nuestros usuarios, enviaremos una notificación por correo electrónico a aquellos que sean afectados por el cambio. Todo cambio en nuestra política de privacidad se publicará en la aplicación CleanApp 30 días antes de que tales cambios ocurran. Por lo tanto, se le recomienda volver a leer esta declaración de manera regular”."
        label4.text = "CleanApp ofrece como segunda opción, el modo invitado para utilizar la aplicación sin que CleanApp guarde ninguna información privada."
        label5.text = "CleanApp retiene los datos hasta que el usuario desee borrar su cuenta definitivamente. Si quiere borrar su cuenta puede enviarnos un correo con su Nombre, Apellido, dirección de correo electrónico i/o nombre de su empresa a k.muster44@gmail.com"
        label6.text = "Si tiene alguna duda sobre las políticas de privacidad no dude de ponerse en contacto, puede enviarnos un correo electrónico a k.muster44@gmail.com"
    }
        
    // MARK: - Observers
}
