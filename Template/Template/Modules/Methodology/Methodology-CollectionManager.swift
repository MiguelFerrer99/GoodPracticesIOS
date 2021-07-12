//
//  Methodology-CollectionManager.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 12/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class MethodologyCollectionManager {
    var collectionSections: [SectionType] = [
        .headerSection
    ]
    
    enum CellType {
        case headerCell
        case productCell
        case deviceCell
        case stepCell
    }
    
    enum SectionType {
        case headerSection
        case productsSection([Product])
        case devicesSection([Device])
        case stepsSection([Step])
    
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
                
            case .stepsSection(let steps):
                var cells: [CellType] = []
                for _ in steps {
                    cells.append(.stepCell)
                }
                return cells
                
            }
        }
    }
    
    func updateCollectionSections(products: [Product], devices: [Device], steps: [Step]) {
        collectionSections = [
            .headerSection,
            .productsSection(products),
            .devicesSection(devices),
            .stepsSection(steps)
        ]
    }
}
