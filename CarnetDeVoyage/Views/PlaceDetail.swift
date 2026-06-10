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
                ZStack(alignment: .topTrailing) {

                    Image(place.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 16)
                        )

                    if place.visited {

                        Label(
                            "Déjà visité",
                            systemImage: "checkmark.circle.fill"
                        )
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(.green.opacity(0.9))
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                        .padding()
                    }
                }
                
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
                    Text("Plat emblématique")
                        .font(.headline)
                    Text(place.famousFood)
                }
                
                Divider()
                
                VStack(alignment: .leading,
                       spacing: 8) {

                    Text("Note")
                        .font(.headline)

                    if place.rating > 0 {

                        HStack {
                            ForEach(0..<place.rating,
                                    id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                            }
                        }

                    } else {

                        Text("Pas encore noté")
                            .foregroundStyle(.secondary)
                            .italic()
                    }
                }
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
