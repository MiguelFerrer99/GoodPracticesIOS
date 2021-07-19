//
//  Frecuency.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 15/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

class Frequency: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case id, name, image
    }
    
    //MARK: - Properties
    let id: String
    let name: String?
    let image: Image?
}
