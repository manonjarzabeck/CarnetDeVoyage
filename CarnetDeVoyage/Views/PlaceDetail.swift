//
//  PlaceDetail.swift
//  CarnetDeVoyage
//
//  Created by Manon  on 08/06/2026.
//

import SwiftUI

struct PlaceDetailView: View {
    
    let place: Place
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading,
                   spacing: 20) {
                
                Image(place.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                VStack(alignment: .leading,
                       spacing: 8) {
                    
                    Text(place.city)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(place.country)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                
                Divider()
                
                VStack(alignment: .leading,
                       spacing: 8) {
                    
                    Text("🍴 Plat emblématique")
                        .font(.headline)
                    Text(place.famousFood)
                }
                
                Divider()
                
                VStack(alignment: .leading,
                       spacing: 8) {
                    Text("⭐ Note")
                        .font(.headline)
                    
                    HStack {
                        ForEach(0..<place.rating,
                                id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                        }
                    }
                }
                
                if place.visited {
                    
                    Label(
                        "Déjà visité",
                        systemImage: "checkmark.circle.fill"
                    )
                    .padding()
                    .background(.green.opacity(0.15))
                    .clipShape(Capsule())
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle(place.city)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PlaceDetailView(
        place: Place.examples[0]
    )
}
