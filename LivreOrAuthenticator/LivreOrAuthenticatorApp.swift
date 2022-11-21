//
//  LivreOrAuthenticatorApp.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

@main
struct LivreOrAuthenticatorApp: App {
    @StateObject var authenticationVM = AuthenticationViewModel()
    var body: some Scene {
        WindowGroup {
            MasterView()
                .environmentObject(authenticationVM)
        }
    }
}
