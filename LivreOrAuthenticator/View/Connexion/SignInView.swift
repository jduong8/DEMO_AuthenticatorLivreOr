//
//  SignInView.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var authenticationVM: AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                usernameInput()
                passwordInput()
                signInButton()
                VStack(alignment: .center) {
                    Text("Vous n'avez pas de compte ?")
                    signUpSheet()
                }.padding()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            .navigationTitle("Connexion")
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
