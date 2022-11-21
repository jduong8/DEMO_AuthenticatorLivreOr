//
//  SignInView+View.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

extension SignInView {
    
    func usernameInput() -> some View {
        VStack(alignment: .leading) {
            Text("Username")
            TextField("Username", text: $authenticationVM.username)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .frame(maxWidth: .infinity, maxHeight: 20)
                .textFieldStyle(.roundedBorder)
        }.padding(.bottom)
    }
    func passwordInput() -> some View {
        VStack(alignment: .leading) {
            Text("Password")
            SecureField("Password", text: $authenticationVM.password)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .frame(maxWidth: .infinity, maxHeight: 20)
                .textFieldStyle(.roundedBorder)
        }.padding(.bottom)
    }
    
    func signInButton() -> some View {
        Button {
            Task {
                do {
                    authenticationVM.signInResponse = try await authenticationVM.connexion(username: authenticationVM.username, authenticationVM.password)
                } catch {
                    print(error)
                }
            }
        } label: {
            Capsule()
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .overlay {
                    Text("Connexion")
                        .foregroundColor(.white)
                }
        }
    }
    
    func signUpSheet() -> some View {
        Button {
            authenticationVM.isAccount.toggle()
        } label: {
            Text("S'incrire")
        }.fullScreenCover(isPresented: $authenticationVM.isAccount) {
            SignUpView()
        }
    }
}
