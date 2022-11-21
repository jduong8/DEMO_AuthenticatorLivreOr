//
//  SignInResponse.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

struct SignInResponse: Identifiable, Codable {
    var id: Int
    var username: String
    var email: String
    var roles: [String]
    var accessToken: String
}
