//
//  User.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 14/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

class User: Codable {
    
    static var me: User?
    
    static var isLogged: Bool {
        return me != nil
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, email
        case firstName    = "first_name"
        case lastName     = "last_name"
        case isBusiness   = "is_business"
        case businessName = "business_name"
    }
    
    let id: String
    let email, firstName, lastName, businessName: String?
    let isBusiness: Bool?
}
