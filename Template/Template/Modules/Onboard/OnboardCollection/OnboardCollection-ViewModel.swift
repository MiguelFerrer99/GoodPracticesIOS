//
//  OnboardCollectoin-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 6/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class OnboardCollectionViewModel: ViewModel {

  let onboardScreens: [OnboardScreen]

  init() {
    onboardScreens = [
        OnboardScreen(image: "Onboard_0", title: "Bienvenido a CleanApp", description: ""),
        OnboardScreen(image: "Onboard_1", title: "Aprende como limpiar de forma óptima.", description: "Todos los métodos y sistemas de limpieza en una aplicación."),
        OnboardScreen(image: "Onboard_2", title: "Para empresas.", description: "Guía paso a paso sobre todos los métodos de limpiesza, sus productos y mucho más."),
        OnboardScreen(image: "Onboard_3", title: "Para personas privadas.", description: "Sepa cómo tener la casa limpia de forma segura.")
    ]
  }
}
