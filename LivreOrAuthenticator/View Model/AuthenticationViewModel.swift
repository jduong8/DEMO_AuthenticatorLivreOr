//
//  AuthenticationViewModel.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

class AuthenticationViewModel: ObservableObject {
    @Published var user: User?
    @Published var signInResponse: SignInResponse?
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isAccount: Bool = false

    let endPoint: String = "http://localhost:8080/api/auth/"
}
