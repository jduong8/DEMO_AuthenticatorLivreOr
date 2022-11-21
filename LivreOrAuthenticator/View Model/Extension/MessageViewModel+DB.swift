//
//  MessageViewModel+DB.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

extension MessageViewModel {
    
    public func getMessage() async throws -> [Message] {
        guard let url = URL(string: "\(endPoint)index")
        else {
            fatalError("MISSING URL")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            fatalError("ERROR WHILE FETCHING DATA")
        }
        let decoder = JSONDecoder()
        let decodedMessages = try decoder.decode([Message].self, from: data)
        return decodedMessages
    }
    
    public func postMessage(_ message: Message) async throws -> Message {
        guard let url = URL(string: "\(endPoint)index")
        else {
            fatalError("MISSING URL !")
        }
        
        let body: [String: String] = [
            "content": message.content
        ]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try? JSONEncoder().encode(body)

        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decorder = JSONDecoder()
        let decodedMessage = try decorder.decode(Message.self, from: data)
        
        return decodedMessage
    }
}
