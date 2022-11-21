//
//  MasterLoginView.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

struct MasterLoginView: View {
    
    @EnvironmentObject var authenticationVM: AuthenticationViewModel
    
    var body: some View {
        VStack {
            if let _ = authenticationVM.signInResponse {
                ProfileView()
            } else {
                SignInView()
            }
        }
    }
}
