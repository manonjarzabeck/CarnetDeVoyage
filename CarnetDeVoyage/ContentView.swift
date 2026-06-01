//
//  ContentView.swift
//  CarnetDeVoyage
//
//  Created by Manon  on 01/06/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "moon.stars")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome to my app 🏔️")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
