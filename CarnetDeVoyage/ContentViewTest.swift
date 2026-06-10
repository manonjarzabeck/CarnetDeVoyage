//
//  ContentView.swift
//  CarnetDeVoyage
//
//  Created by Manon  on 01/06/2026.
//

import SwiftUI

import SwiftUI

struct CardStyle: ViewModifier {

    func body(content: Content) -> some View {
        content
            .background(.background)
            .clipShape(.rect(cornerRadius: 16))
            .shadow(radius: 4)
    }
}

struct Badge: ViewModifier {

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .topTrailing) {
                Label("Visité", systemImage: "checkmark.circle.fill")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 4)
                    .background(.green)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                    .padding()
            }
    }
}

struct ContentView: View {

    var body: some View {

        ScrollView {

            VStack(spacing: 24) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Image("krakow")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                        .modifier(Badge())
                    Text("Cracovie")
                        .font(.title.bold())
                    Label("Pologne", systemImage: "map")
                        .foregroundStyle(.secondary)
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                    }
                    .foregroundStyle(.yellow)
                }
                .modifier(CardStyle())
                .padding(.horizontal)


                VStack(alignment: .leading) {
                    Image("noumea")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                    Text("Nouméa")
                        .font(.title.bold())
                    Label("Nouvelle-Calédonie", systemImage: "map")
                        .foregroundStyle(.secondary)
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star")
                    }
                    .foregroundStyle(.yellow)
                }
                .modifier(CardStyle())
                .padding(.horizontal)

                VStack(alignment: .leading) {
                    Image("norway")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                    Text("Oslo")
                        .font(.title.bold())
                    Label("Norvège", systemImage: "map")
                        .foregroundStyle(.secondary)
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                    }
                    .foregroundStyle(.yellow)
                }
                .modifier(CardStyle())
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
}
