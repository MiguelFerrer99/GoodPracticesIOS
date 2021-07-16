//
//  DeviceDetail.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

struct DeviceDetail: Codable {
    
  private enum CodingKeys: String, CodingKey {
    case id, image, brand, attachments, products, name
    case shortDescription   = "short_description"
    case longDescription    = "long_description"
    case buyLink            = "buy_link"
    case isAvailable        = "is_available"
    case itemType           = "item_type"
  }

  //MARK: - Properties
  let id: String
  let image: Image?
  let brand: Brand?
  let attachments: [Device]?
  let products: [Product]?
  let name, shortDescription, longDescription, buyLink: String?
  let isAvailable: Bool?
  let itemType: ItemType?
}
