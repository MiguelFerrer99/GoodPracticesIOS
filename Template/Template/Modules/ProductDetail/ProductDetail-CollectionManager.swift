//
//  ProductDetail-CollectionManager.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 13/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class ProductDetailCollectionManager {
    var collectionSections: [SectionType] = [
        .headerSection
    ]
    
    enum CellType {
        case headerCell
        case productCell
        case deviceCell
    }
    
    enum SectionType {
        case headerSection
        case productsSection([Product])
        case devicesSection([Device])
    
        var sectionCells: [CellType] {
            switch self {
            case .headerSection:
                return [.headerCell]
                
            case .productsSection(let products):
                var cells: [CellType] = []
                for _ in products {
                    cells.append(.productCell)
                }
                return cells
                
            case .devicesSection(let devices):
                var cells: [CellType] = []
                for _ in devices {
                    cells.append(.deviceCell)
                }
                return cells
            }
        }
    }
    
    func addProductsSection(products: [Product]) {
        self.collectionSections.append(.productsSection(products))
    }

    func addDevicesSection(devices: [Device]){
      self.collectionSections.append(.devicesSection(devices))
    }
}
