//
//  SignUpView+View.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

extension SignUpView {
    
    func usernameInput() -> some View {
        VStack(alignment: .leading) {
            Text("Username")
            TextField("Username", text: $username)
                .frame(maxWidth: .infinity, maxHeight: 20)
                .textContentType(.username)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.none)
        }.padding(.bottom)
    }
    func emailInput() -> some View {
        VStack(alignment: .leading) {
            Text("Email")
            TextField("Email", text: $email)
                .frame(maxWidth: .infinity, maxHeight: 20)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
        }.padding(.bottom)
    }
    
    func passwordInput() -> some View {
        VStack(alignment: .leading) {
            Text("Password")
            SecureField("Password", text: $password)
                .textContentType(.password)
                .frame(maxWidth: .infinity, maxHeight: 20)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.none)
        }.padding(.bottom)
    }
    func signUpButton() -> some View {
        Button {
            Task {
                authenticationVM.user = try await authenticationVM.postUser(username: username, email: email, password: password)
            }
            Task {
                username = ""
                email = ""
                password = ""
            }
        } label: {
            Capsule()
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .overlay {
                    Text("S'inscrire")
                        .foregroundColor(.white)
                }
        }
    }
}
