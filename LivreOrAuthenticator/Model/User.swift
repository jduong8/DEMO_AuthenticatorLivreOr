//
//  User.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

struct User: Identifiable, Codable, Hashable {
    var id: Int
    var username: String
    var email: String
//    var role: Role
}

enum Role: String, CaseIterable, Codable {
    case user = "User"
    case moderator = "Moderator"
    case admin = "Administrator"
    
    var id: String { self.rawValue }
}
