//
//  Message.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

struct Message: Identifiable, Codable {
    var id: Int
    var content: String
    var userId: Int
}
