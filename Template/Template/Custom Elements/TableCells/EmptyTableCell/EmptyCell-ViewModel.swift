//
//  EmptyCell-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 16/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class EmptyCellViewModel: ViewModel {
    
    //MARK: - Properties
    let message: String
    let navBarHeight: CGFloat
    let tabBarHeight: CGFloat
    
    //MARK: - Initializer
    init(message: String, navBarHeight: CGFloat, tabBarHeight: CGFloat) {
        self.message = message
        self.navBarHeight = navBarHeight
        self.tabBarHeight = tabBarHeight
    }
}
