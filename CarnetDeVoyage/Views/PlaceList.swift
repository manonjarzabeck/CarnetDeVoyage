//
//  PlaceList.swift
//  CarnetDeVoyage
//
//  Created by Manon  on 08/06/2026.
//

import SwiftUI

struct PlaceListView: View {
    
    let places = Place.examples
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(places) { place in
                    NavigationLink {
                        PlaceDetailView(place: place)
                        
                    } label: {
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(place.city)
                                    .font(.headline)
                                Text(place.country)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            if place.visited {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(.green)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Carnet de voyage")
        }
    }
}

#Preview {
    PlaceListView()
}
