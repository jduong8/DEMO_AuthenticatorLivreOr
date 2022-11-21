//
//  ProfileView.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 21/11/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authenticationVM: AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("USERNAME : \(authenticationVM.username)")
                    .bold()
                
                logout()
                    .frame(maxHeight: 300, alignment: .bottom)
            }
            .navigationTitle("Profile View")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthenticationViewModel())
    }
}

