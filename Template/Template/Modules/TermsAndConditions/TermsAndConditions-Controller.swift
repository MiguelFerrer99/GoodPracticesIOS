//
//  TermsAndConditions-Controller.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class TermsAndConditionsViewController: ViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    
    // MARK: - Properties
    override var hideNavigationBar: Bool {
        return false
    }
    override var navBarTitle: String {
        return "Terminos y condiciones"
    }
        
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
        
    // MARK: - Functions
    func setUpUI() {
        label1.text = "Al acceder y utilizar este servicio, usted acepta y accede a estar obligado por los términos y disposiciones de este acuerdo. Asimismo, al utilizar estos servicios particulares, usted estará sujeto a toda regla o guía de uso correspondiente que se haya publicado para dichos servicios. Toda participación en este servicio constituirá la aceptación de este acuerdo. Si no acepta cumplir con lo anterior, por favor, no lo utilice. CleanApp se guarda los derechos de todo tipo de cambio o modificación de los Términos y condiciones sin previo aviso."
        label2.text = "CleanApp es una aplicación que ayuda al usuario privado, profesionales y empresas a tener acceso a información profesional que busca con más facilidad. Con ayuda de filtros el usuario puede buscar la clase de tarea que tiene o quiere hacer. CleanApp le muestra detalladamente dependiendo mucho de los productos y maquinas que tenga a su disposición, si el usuario no tiene o se muestra interesado en algún producto lo puede comprar i/o informarse mejor haciendo clic en el “enlace de compra” que le aparece en pantalla y este abrirá una nueva ventana donde podrá comprar el producto en la página oficial de la distribuidora. Con CleanApp tendrá acceso a información sobre el uso, cuidado y mantenimiento correcto de las máquinas de limpieza, recomendación de seguridad, guía paso a paso de como limpiar objetos o lugares, información de los productos de limpieza, su uso correcto y la forma segura de guardarlo, métodos y sistemas de limpieza de todo tipo."
        label3.text = "Las grandes distribuidoras del que CleanApp posee información son Wetrok, Taski & Kärcher. CleanApp se guarda el derecho de modificar cualquier información dentro de CleanApp. CleanApp no se hace responsable del contenido de la información obtenida por parte de las distribuidoras, al menos de que esta haya sido modificada por CleanApp. La página, las características y la funcionalidad son propiedad de CleanApp."
        label4.text = "En el futuro se van a ir sumando más distribuidoras. El usuario registrado puede compartir, imprimir, guardar en formato PDF o en “Elementos guardados” los métodos de limpieza que busco o le interesa mediante el botón que aparece arriba a la derecha, también a cambiar su información personal en el perfil. Los usuarios no registrados no tienen derecho a compartir, copiar o reproducir toda clase de contenido dentro de CleanApp."
        label5.text = "No se puede crear mas de una cuenta con la misma dirección de email. “Podemos cancelar su acceso a la página, sin causa o aviso, lo cual podrá resultar en la incautación y destrucción de toda la información que esté asociada con su cuenta."
        label6.text = "Las compras hechas mediante CleanApp serán ejecutadas en la pagina oficial dependiendo de la distribuidora de limpieza que eligió. En algunos casos será necesario llamar por teléfono o escribir por email para realizar la compra de algún producto dependiendo de la distribuidora y producto. Una vez hecho clic en “enlace de compra” que le lleva a la pagina oficial de la distribuidora que elegio, CleanApp no se responsabiliza por los errores que pueden ocurrir durante y después de la compra y de la información que contenga la página web oficial, cada una tiene diferentes tipos de pago y diferentes procesos. Aquí tendrá que dar todos sus datos personales para hacer la compra."
        label7.text = "Si el usuario tiene alguna duda sobre algún producto también tiene la posibilidad de contactar un experto de la distribuidora que elegio. El numero de contacto aparecerá en pantalla. CleanApp no se hace responsable de la información que obtenga de los expertos."
    }
        
    // MARK: - Observers
}
