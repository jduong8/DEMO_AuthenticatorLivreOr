//
//  MessageData.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

extension Message {
    static func mock() -> Message {
        Message(id: 0, content: "No message find in Database", userId: 0)
    }
}

extension Array where Element == Message {
    static let mockMessages: [Message] =
    [
        .mock(),
        Message(id: 1, content: "No message", userId: 0)
    ]
}
