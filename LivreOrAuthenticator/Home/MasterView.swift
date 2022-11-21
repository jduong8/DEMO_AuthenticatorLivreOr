//
//  MasterView.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

struct MasterView: View {
    @EnvironmentObject var authenticationVM: AuthenticationViewModel
    var body: some View {
        TabView {
            MessageView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Message")
                }
            MasterLoginView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Connexion")
                }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
            .environmentObject(AuthenticationViewModel())
    }
}
