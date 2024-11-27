//
//  User.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-27.
//

import Foundation

struct User: Identifiable, Codable {
    var id = NSUUID().uuidString
    var accountType: AccountTypt
    let fullName: String
    let email: String
    let profileImageURL: String
}

enum AccountTypt: Int, Codable {
    case host
    case guest
    
    var description: String {
        switch self {
        case .host: return "Host"
        case .guest: return "Guest"
        }
    }
}
