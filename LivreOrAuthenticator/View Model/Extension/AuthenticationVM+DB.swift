//
//  AuthenticationVM+DB.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

extension AuthenticationViewModel {
    
    /*------------------- Récupration des Utilisateurs depuis une API -------------------*/
    public func getUsers() async throws -> [User] {
        guard let url = URL(string: "\(endPoint)index")
        else {
            fatalError("MISSING URL !")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            fatalError("ERROR WHILE FETCHING DATA")
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedUsers = try decoder.decode([User].self, from: data)
        
        return decodedUsers
    }
    
    /*------------------- Créer un Utilisateur vers une API -------------------*/
    public func postUser(username: String, email: String, password: String) async throws -> User {
        guard let url = URL(string: "\(endPoint)signup")
        else {
            fatalError("MISSING URL !")
        }
        
        let body: [String: String] = [
            "username": username,
            "email": email,
            "password": password
        ]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try? JSONEncoder().encode(body)

        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedUser = try decoder.decode(User.self, from: data)
        
        return decodedUser
    }
    
    /*------------------- Connecter un Utilisateur via une API -------------------*/
    public func connexion(username: String,_ password: String) async throws -> (SignInResponse){
        guard let url = URL(string: "\(endPoint)signin")
        else {
            fatalError("MISSING URL !")
        }
        
        let body: [String: String] = [
            "username": username,
            "password": password
        ]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try? JSONEncoder().encode(body)

        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let response = try decoder.decode(SignInResponse.self, from: data)
        
        print("success: \(response)")
        let keychainItem = KeychainItem(service: "iJoe.LivreOrAuthenticator", account: "accessToken")
        try keychainItem.saveItem(response.accessToken)
        
        print(response.username)
        print(response.id)
        return response
//        DispatchQueue.main.async {
//            self.signInResponse = response
//            self.username = response.username
//        }
    }
}
