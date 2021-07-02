//
//  Generic-Service.swift
//  GoodPractices
//
//  Created by Joel Sifres on 26/03/2020.
//  Copyright © 2020 Rudo. All rights reserved.
//

import Foundation

class GenericService {
  func update_required(version: String, completionHandler: @escaping ((Result<UpdateRequired, API.NetworkError>) -> Void)) {
    Cache.logOut()
    
    let parameters: [String: Any] = ["platform" : "ios", "version" : version]

    API.shared.callDecoding(GenericAPI.update_required(parameters), of: UpdateRequired.self, completion: completionHandler)
  }
}
