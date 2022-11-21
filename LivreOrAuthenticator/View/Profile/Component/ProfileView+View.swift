//
//  ProfileView+View.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 21/11/2022.
//

import SwiftUI

extension ProfileView {
    
    func logout() -> some View {
        Button {
            authenticationVM.signInResponse = nil
            Task {
                authenticationVM.username = ""
                authenticationVM.password = ""
            }
        } label: {
            Capsule()
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .overlay {
                    Text("Se déconnecter")
                        .foregroundColor(.white)
                }
        }
        .padding()
    }
}

