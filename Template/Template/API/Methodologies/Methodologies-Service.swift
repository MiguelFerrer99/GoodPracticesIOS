//
//  Methodologies-Service.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 15/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

class MethodologiesService {
    
    static var searchParameters: [String: String]? {
        didSet { NotificationCenter.default.post(name: .FiltersChanged, object: nil) }
    }
    
    func getMethodologies(completionHandler: @escaping ((Result<[Methodology], API.NetworkError>) -> Void)) {
        API.shared.callDecoding(MethodologiesAPI.getMethodologies(MethodologiesService.searchParameters ?? [:]), of: [Methodology].self, completion: completionHandler)
    }
    
    func getSavedMethodologies(completionHandler: @escaping ((Result<[Methodology], API.NetworkError>) -> Void)) {
        API.shared.callDecoding(MethodologiesAPI.getSavedMethodologies, of: [Methodology].self, completion: completionHandler)
    }
    
    func saveMethodology(methodologyId: String, completionHandler: @escaping ((Result<[String: String], API.NetworkError>) -> Void)) {
      API.shared.callDecoding(MethodologiesAPI.saveMethodology(methodologyId), of: [String: String].self, completion: completionHandler)
    }

    func getPlaces(completionHandler: @escaping ((Result<[Place], API.NetworkError>) -> Void)) {
      API.shared.callDecoding(MethodologiesAPI.getPlaces, of: [Place].self, completion: completionHandler)
    }

    func getFrequencies(completionHandler: @escaping ((Result<[Frequency], API.NetworkError>) -> Void)) {
        API.shared.callDecoding(MethodologiesAPI.getFrequencies, of: [Frequency].self, completion: completionHandler)
    }

    func getMethodologieDetails(methodolodyID: String, completionHandler: @escaping ((Result<Methodology, API.NetworkError>) -> Void)) {
      API.shared.callDecoding(MethodologiesAPI.getMethodologyDetails(methodolodyID), of: Methodology.self, completion: completionHandler)
    }
}
