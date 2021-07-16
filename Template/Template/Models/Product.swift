//
//  Brand.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

struct Product: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case id, name, image, brand
        case itemType = "item_type"
    }
    
    //MARK: - Properties
    let id: String
    let image: Image?
    let name: String?
    let brand: Brand?
    let itemType: ItemType?
}
