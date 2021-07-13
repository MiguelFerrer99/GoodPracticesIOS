//
//  Home-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class HomeViewModel: ViewModel {
    
    //MARK: - Properties
    var methodologies: [Methodology]
    var savedMethodologies: [Methodology]
    var methodology1: Methodology
    var productsMethodology1: [Product]
    var product1, product2, product3, product4, product5: Product
    var brand1: Brand
    var devicesMethodology1: [Device]
    var device1, device2, device3: Device
    var stepsMethodology1: [Step]
    var step1, step2, step3, step4: Step
    
    //MARK: - Initializer
    init() {
        brand1 = Brand(name: "Karcher", image: UIImage(systemName: "1.circle.fill")!)
        product1 = Product(image: UIImage(named: "exampleProductPhoto")!, name: "Producto 1", brand: brand1, shortDescription: "Se trata de un líquido para pulir las superficies metales sin posibilidad de dañarlas", longDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", related: [], devices: [])
        product2 = Product(image: UIImage(named: "exampleProductPhoto")!, name: "Producto 2", brand: brand1, shortDescription: "Se trata de un líquido para pulir las superficies metales sin posibilidad de dañarlas", longDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", related: [product1], devices: [])
        product3 = Product(image: UIImage(named: "exampleProductPhoto")!, name: "Producto 3", brand: brand1, shortDescription: "Se trata de un líquido para pulir las superficies metales sin posibilidad de dañarlas", longDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", related: [product1, product2], devices: [])
        product4 = Product(image: UIImage(named: "exampleProductPhoto")!, name: "Producto 4", brand: brand1, shortDescription: "Se trata de un líquido para pulir las superficies metales sin posibilidad de dañarlas", longDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", related: [product1, product2, product3], devices: [])
        product5 = Product(image: UIImage(named: "exampleProductPhoto")!, name: "Producto 5", brand: brand1, shortDescription: "Se trata de un líquido para pulir las superficies metales sin posibilidad de dañarlas", longDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", related: [product1, product2, product3, product4], devices: [])
        productsMethodology1 = [product1, product2, product3, product4, product5]
        device1 = Device(name: "Device 1", image: UIImage(named: "exampleDevicePhoto")!, brand: brand1, shortDescription: "Se trata de un aparato para pulir las superficies metales sin posibilidad de dañarlas", longDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", attachments: [], products: [product1, product2, product3, product4, product5])
        device2 = Device(name: "Devoce 2", image: UIImage(named: "exampleDevicePhoto")!, brand: brand1, shortDescription: "Se trata de un aparato para pulir las superficies metales sin posibilidad de dañarlas", longDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", attachments: [device1], products: [product1, product2, product3, product4, product5])
        device3 = Device(name: "Device 3", image: UIImage(named: "exampleDevicePhoto")!, brand: brand1, shortDescription: "Se trata de un aparato para pulir las superficies metales sin posibilidad de dañarlas", longDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", attachments: [device1, device2], products: [product1, product2, product3, product4, product5])
        devicesMethodology1 = [device1, device2, device3]
        product1.devices = [device1, device2, device3]
        product2.devices = [device1, device2, device3]
        product3.devices = [device1, device2, device3]
        product4.devices = [device1, device2, device3]
        step1 = Step(image: UIImage(named: "exampleStepPhoto")!, stepNumber: 1, method: "Secado", specifications: "Preparar un trapo que no suelte pelo", notes: "Dejarlo bien reluciente para que el cliente este contento y blablablabla", methodology: "A mano")
        step2 = Step(image: UIImage(named: "exampleStepPhoto")!, stepNumber: 2, method: "Secado", specifications: "Preparar un trapo que no suelte pelo", notes: "Dejarlo bien reluciente para que el cliente este contento y blablablabla", methodology: "A mano")
        step3 = Step(image: UIImage(named: "exampleStepPhoto")!, stepNumber: 3, method: "Secado", specifications: "Preparar un trapo que no suelte pelo", notes: "Dejarlo bien reluciente para que el cliente este contento y blablablabla", methodology: "A mano")
        step4 = Step(image: UIImage(named: "exampleStepPhoto")!, stepNumber: 4, method: "Secado", specifications: "Preparar un trapo que no suelte pelo", notes: "Dejarlo bien reluciente para que el cliente este contento y blablablabla", methodology: "A mano")
        stepsMethodology1 = [step1, step2, step3, step4]

        methodology1 = Methodology(index: 0, name: "Aspirado Seco", subtitle: "Aspirar", shortDescription: "Se trata de un aspirado seco el cual mejora las cualidades del objeto, alargando su vida", longDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", isSaved: false, image: UIImage(named: "methodology1_image")!, products: productsMethodology1, devices: devicesMethodology1, steps: stepsMethodology1)
        
        methodologies = [methodology1]
        savedMethodologies = []
    }
    
    //MARK: - Functions
}
