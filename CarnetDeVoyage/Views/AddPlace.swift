//
//  AddPlace.swift
//  CarnetDeVoyage
//
//  Created by Manon  on 08/06/2026.
//

import SwiftUI

struct AddPlace: View {
    
    @Binding var places: [Place]
    
    @Environment(\.dismiss)
    private var dismiss
    
    @State private var city = ""
    @State private var country = ""
    @State private var famousFood = ""
    @State private var visited = false
    @State private var rating = 3
    
    var body: some View {

        NavigationStack {
            Form {
                
                TextField(
                    "Ville",
                    text: $city
                )
                TextField(
                    "Pays",
                    text: $country
                )
                TextField(
                    "Plat emblématique",
                    text: $famousFood
                )
                Toggle(
                    "Déjà visité",
                    isOn: $visited
                )
                Stepper(
                    "Note : \(rating)",
                    value: $rating,
                    in: 0...5
                )
            }
            .navigationTitle("Ajouter un lieu")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Annuler") {
                        dismiss()
                    }
                }
                ToolbarItem(
                    placement: .topBarTrailing
                ) {
                    Button("Ajouter") {

                        let newPlace = Place(
                            city: city,
                            country: country,
                            visited: visited,
                            rating: rating,
                            famousFood: famousFood,
                            imageName: "placeholder"
                        )
                        withAnimation {
                            places.append(newPlace)
                        }
                        dismiss()
                    }.fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    AddPlace(places: .constant([]))
}
