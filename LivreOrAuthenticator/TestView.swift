//
//  TestView.swift
//  LivreOrAuthenticator
//
//  Created by Jonathan Duong on 18/11/2022.
//

import SwiftUI

struct TestView: View {
    
    @Binding var isLog: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("You are connected !")
                .bold()
        }
    }
}
