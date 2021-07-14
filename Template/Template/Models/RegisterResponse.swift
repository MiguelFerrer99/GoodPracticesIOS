//
//  RegisterResponse.swift
//  Template
//
//  Created by Miguel Ferrer Fornali on 14/7/21.
//  Copyright © 2021 Rudo. All rights reserved.
//

import Foundation

class RegisterResponse: Codable {
    private enum CodingKeys: String, CodingKey {
        case id, username, email
        case firstName    = "first_name"
        case lastName     = "last_name"
        case isBusiness   = "is_business"
        case businessName = "business_name"
    }
    
    let id: String
    let username:String
    let email:String
    let firstName:String
    let lastName: String
    let isBusiness: Bool
    let businessName: String?
}
