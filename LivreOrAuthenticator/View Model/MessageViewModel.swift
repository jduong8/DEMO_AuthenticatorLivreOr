//
//  MessageViewModel.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

class MessageViewModel: ObservableObject {
    @Published var message: Message?
    @Published var messages: [Message] = .mockMessages
    
    let endPoint: String = "http://localhost:8080/messages/"
}
