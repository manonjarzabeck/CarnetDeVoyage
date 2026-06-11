//
//  PlaceList.swift
//  CarnetDeVoyage
//
//  Created by Manon  on 08/06/2026.
//

import SwiftUI

struct PlaceListView: View {
    @State private var showAddPlace = false
    @State private var places = Place.examples
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
                .onDelete { indexSet in
                    withAnimation {
                        places.remove(atOffsets: indexSet)
                    }
                }
            }
            .navigationTitle("Mes voyages 🧡")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddPlace = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showAddPlace) {
                        AddPlace(places: $places)
                    }
                }
            }
        }
    }
}

#Preview {
    PlaceListView()
}
