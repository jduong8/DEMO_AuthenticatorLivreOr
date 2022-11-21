//
//  MessageCellRowView.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

struct MessageCellRowView: View {
    @ObservedObject var messageVM: MessageViewModel
    @EnvironmentObject var authenticationVM: AuthenticationViewModel
    var body: some View {
        List {
            if let response = authenticationVM.signInResponse {
                ForEach(messageVM.messages.filter { $0.userId == response.id }) { message in
                    Text(message.content)
                }
            }
        }
        .task {
            do {
                messageVM.messages = try await messageVM.getMessage()
            } catch {
                fatalError("NO DATA")
            }
        }
    }
}
