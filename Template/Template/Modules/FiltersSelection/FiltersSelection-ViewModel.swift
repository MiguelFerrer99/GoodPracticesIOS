//
//  FiltersSelection-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

protocol FiltersSelectionViewControllerDelegate: AnyObject {
  func changeQuestion(question: Question, index: Int)

  func changeSelectedPlace(place: Place)
  func changeSelectedFrequency(frequency: Frequency)
  func changeSelectedBrand(brand: Brand)
}

class FiltersSelectionViewModel: ViewModel {
  var question: Question
  var index: Int

  var devicesService = DevicesService()

  var places: [Place]?
  var frequencies: [Frequency]?
  var brands: [Brand]?
  var deviceTypes: [ItemType]?
  var selectedBrand: Brand?
  var selectedType: ItemType?
  weak var delegate: FiltersSelectionViewControllerDelegate?
  
  init(question: Question, index: Int, places: [Place]? = nil, frequencies: [Frequency]? = nil, brands: [Brand]? = nil, deviceTypes: [ItemType]? = nil, selectedBrand: Brand? = nil) {
    self.question = question
    self.index = index
    self.places = places
    self.frequencies = frequencies
    self.brands = brands
    self.deviceTypes = deviceTypes
    self.selectedBrand = selectedBrand
  }
}
