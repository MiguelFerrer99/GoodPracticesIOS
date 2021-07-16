//
//  Methodology.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 11/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class Methodology: Codable {

    private enum CodingKeys: String, CodingKey {
        case id
        case image
        case steps
        case products
        case devices
        case place
        case frequency
        case name
        case subtitle
        case isSaved          = "is_saved"
        case shortDescription = "short_description"
        case longDescription  = "long_description"
        case isManual         = "is_manual"
    }

    //MARK: - Properties
    let id: String
    let image: Image?
    let steps: [Step]?
    let products: [Product]?
    let devices: [Device]?
    var isSaved: Bool
    let isManual: Bool?
    let place: Place?
    let frequency: Frequency?
    let name, subtitle, shortDescription, longDescription: String?
}
