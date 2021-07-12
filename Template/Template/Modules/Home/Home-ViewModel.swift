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
    var product1: Product
    var brand1: Brand
    var devicesMethodology1: [Device]
    var device1: Device
    var stepsMethodology1: [Step]
    var step1: Step
    
    //MARK: - Initializer
    init() {
        brand1 = Brand(name: "Karcher", image: UIImage(systemName: "1.circle.fill")!)
        product1 = Product(image: UIImage(named: "exampleProductPhoto")!, name: "Producto 1", brand: brand1)
        productsMethodology1 = [product1]
        device1 = Device(name: "K5000", image: UIImage(named: "exampleDevicePhoto")!, brand: brand1)
        devicesMethodology1 = [device1]
        step1 = Step(image: UIImage(named: "exampleStepPhoto")!, stepNumber: 1, method: "Secado", specifications: "Preparar un trapo que no suelte pelo", notes: "Dejarlo bien reluciente", methodology: "A mano")
        stepsMethodology1 = [step1]

        methodology1 = Methodology(index: 0, name: "Aspirado Seco", subtitle: "Aspirar", shortDescription: "Se trata de un aspirado seco el cual mejora las cualidades del objeto, alargando su vida", longDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", isSaved: false, image: UIImage(named: "methodology1_image")!, products: productsMethodology1, devices: devicesMethodology1, steps: stepsMethodology1)
        
        methodologies = [methodology1]
        savedMethodologies = []
        for index in 0..<methodologies.count {
            if methodologies[index].isSaved {
                savedMethodologies.append(methodologies[index])
            }
        }
    }
    
    //MARK: - Functions
}
