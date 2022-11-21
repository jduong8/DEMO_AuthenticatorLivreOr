//
//  SignUpView.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var authenticationVM = AuthenticationViewModel()
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                usernameInput()
                emailInput()
                passwordInput()
                signUpButton()
            }.padding()
            .navigationTitle("Inscription")
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
