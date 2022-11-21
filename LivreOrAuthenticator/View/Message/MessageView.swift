//
//  MessageView.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

struct MessageView: View {
    @StateObject var messageVM = MessageViewModel()
    @EnvironmentObject var authenticationVM: AuthenticationViewModel
    var body: some View {
        NavigationView {
            if (authenticationVM.signInResponse != nil) {
                MessageCellRowView(messageVM: messageVM)
            } else {
                Text("Pas de message")
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
            .environmentObject(AuthenticationViewModel())
    }
}
