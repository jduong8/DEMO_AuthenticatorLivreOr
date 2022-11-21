//
//  UserData.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

extension User {
    static func mockUser() -> User {
        User(id: 0, username: "", email: "")
    }
}

extension Array where Element == User {
    static let mockUsers: [User] =
    [
        .mockUser(),
        User(id: 1, username: "User", email: "user@email.com"),
        User(id: 2, username: "Administrator", email: "admin@email.com"),
        User(id: 3, username: "Moderator", email: "moderator@email.com")
    ]
}
