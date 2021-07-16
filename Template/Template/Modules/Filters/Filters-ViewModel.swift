//
//  Filters-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 8/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class FiltersViewModel: ViewModel {
    
    enum CellType {
        case place
        case frequency
        case manualOrDevice
        case brand
        case device
    }
    
    //MARK: - Properties
    var questions: [Question]
    
    var tableCells: [CellType] = [
        .place,
        .frequency,
        .manualOrDevice
    ]
    
    let methodologiesService = MethodologiesService()
    let devicesService = DevicesService()
    
    var places: [Place] = []
    var frequencies: [Frequency] = []
    var brands: [Brand] = []
    var devices: [Device] = []
    var deviceTypes: [ItemType] = []
    
    private(set) var _selectedBrand: Dynamic<Brand?> = Dynamic(nil)
    var selectedBrand: Brand? {
        get { _selectedBrand.value }
        set { _selectedBrand.value = newValue }
    }
    
    var isManual: Bool? = nil
    var selectedPlace: Place? = nil
    var selectedFrequency: Frequency? = nil
    var selectedDevice: DeviceDetail? = nil
    
    var question1 = Question(title: "Tipo de trabajo", question: "¿Qué trabajo se va a hacer?", answers: [])
    var question2 = Question(title: "Clase de limpieza", question: "¿Qué clase de limpieza?", answers: [])
    var question3 = Question(title: "Manual / Aparato", question: "¿Manual o con algún producto?", answers: [
            Answer(text: "Manual", imagePath: "manual"),
            Answer(text: "Con aparato", imagePath: "con_aparato")
    ])
    var question4 = Question(title: "Marca", question: "¿Marca del producto?", answers: [])
    var question5 = Question(title: "Tipo de aparato", question: "¿Cuál tiene a su disposición?", answers: [])
    
    //MARK: - Initializer
    init() {
        questions = [question1, question2, question3]
        if(questions[2].selectedAnswerIndex == 1) {
            isManual = false
            questions.append(question4)
            questions.append(question5)
        }
        if(questions[2].selectedAnswerIndex == 0) {
            isManual = true
        }
    }
    
    //MARK: - Functions
    func getPlaces(completion: @escaping ((Result<[Place], API.NetworkError>) -> Void)) {
        methodologiesService.getPlaces { result in
            if case .success(let places) = result {
                self.places = places
                self.updateQuestion(number: 1)
            }
            completion(result)
        }
    }
    
    func getFrequencies(completion: @escaping ((Result<[Frequency], API.NetworkError>) -> Void)) {
        methodologiesService.getFrequencies { result in
            if case .success(let frequencies) = result {
                self.frequencies = frequencies
                self.updateQuestion(number: 2)
            }
            completion(result)
        }
    }
    
    func getBrands(completion: @escaping ((Result<[Brand], API.NetworkError>) -> Void)) {
        devicesService.getBrands { result in
            if case .success(let brands) = result {
                self.brands = brands
                self.updateQuestion(number: 4)
            }
            completion(result)
        }
    }
    
    func getDeviceTypes(completion: @escaping ((Result<[ItemType], API.NetworkError>) -> Void)) {
        devicesService.getItemTypes { result in
            if case .success(let deviceTypes) = result {
                self.deviceTypes = deviceTypes
                self.updateQuestion(number: 5)
            }
            completion(result)
        }
    }
    
    func updateQuestion(number: Int) {
      var answers: [Answer] = []
      switch number {
      case 1:
        for place in places {
          answers.append(Answer(text: place.name ?? "place", imagePath: place.image?.thumbnail ?? ""))
        }
        question1 = Question(title: "Tipo de trabajo", question: "¿Qué trabajo se va a hacer?", answers: answers)
        
      case 2:
        for frequency in frequencies {
          answers.append(Answer(text: frequency.name ?? "frequency", imagePath: frequency.image?.thumbnail ?? ""))
        }
        question2 = Question(title: "Clase de limpieza", question: "¿Qué clase de limpieza?", answers: answers)
        
      case 3:
        question3 = Question(title: "Manual / Aparato", question: "¿Manual o con algún producto?", answers: [
                Answer(text: "Manual", imagePath: "manual"),
                Answer(text: "Con aparato", imagePath: "con_aparato")
        ])

      case 4:
        for brand in brands {
          answers.append(Answer(text: brand.name ?? "brand", imagePath: brand.image?.thumbnail ?? ""))
        }
        question4 = Question(title: "Marca", question: "¿Marca del producto?", answers: answers)

      case 5:
        for deviceType in deviceTypes {
          answers.append(Answer(text: deviceType.name!, imagePath: deviceType.image?.midsize ?? ""))
        }
        question5 = Question(title: "Tipo de aparato", question: "¿Cuál tiene a su disposición?", answers: answers)
        
      default:
        break
      }
        
      questions = [question1, question2, question3]
      if(questions[2].selectedAnswerIndex == 1) {
        questions.append(question4)
        questions.append(question5)
        addBrandAndDevice()
      }
    }
    
    func addBrandAndDevice() {
      tableCells = [
        .place,
        .frequency,
        .manualOrDevice,
        .brand,
        .device
      ]
    }

    func removeBrandAndDevice() {
      tableCells = [
        .place,
        .frequency,
        .manualOrDevice
      ]
    }
}
