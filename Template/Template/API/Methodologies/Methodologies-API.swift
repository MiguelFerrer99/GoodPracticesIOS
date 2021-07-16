//
//  Methodologies-API.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 15/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation
import Alamofire

enum MethodologiesAPI: URLRequestConvertible {
    
    case getMethodologies([String: String])
    case getSavedMethodologies
    case saveMethodology(String)
    case getPlaces
    case getFrequencies
    case getMethodologyDetails(String)
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getMethodologies, .getSavedMethodologies, .getPlaces, .getFrequencies, .getMethodologyDetails:
            return .get
        
        case .saveMethodology:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .getMethodologies:
            return "methodologies/"
        
        case .getSavedMethodologies:
            return "methodologies/saved"
        
        case .saveMethodology(let id):
            return "methodologies/\(id)/save/"
            
        case .getPlaces:
            return "methodologies/places/"
            
        case .getFrequencies:
            return "methodologies/frecuency/"
            
        case .getMethodologyDetails(let id):
            return "methodologies/\(id)/"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let urlRequest = self.getURLRequestAndHeadersWith(endpoint: .backend, path, method, setToken: false)
        let urlRequestWithToken = self.getURLRequestAndHeadersWith(endpoint: .backend, path, method, setToken: true)
        
        switch self {
        case .getPlaces, .getFrequencies, .getMethodologyDetails:
            return try Alamofire.JSONEncoding.default.encode(urlRequest)
            
        case .getSavedMethodologies, .saveMethodology:
            return try Alamofire.JSONEncoding.default.encode(urlRequestWithToken)
            
        case .getMethodologies(let parameters):
            return try Alamofire.URLEncoding.default.encode(urlRequestWithToken, with: parameters)
        }
    }
}
