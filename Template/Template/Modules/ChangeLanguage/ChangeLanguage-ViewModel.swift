//
//  ChangeLanguage-ViewModel.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 7/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import UIKit

class ChangeLanguageViewModel: ViewModel {
    
    var selectedLanguage: LanguageOption
    
    init() {
        switch Cache.get(stringFor: .language) {
            case "es":
                selectedLanguage = .spanish
            case "en":
                selectedLanguage = .english
            default:
                selectedLanguage = .spanish
        }
    }
}

enum LanguageOption {
    case spanish, english
}
