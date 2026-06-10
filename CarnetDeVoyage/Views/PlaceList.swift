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
                Section("Déjà visités") {
                    ForEach(
                        places.filter { $0.visited }
                    ) { place in
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
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(.green)
                            }
                        }
                    }
                    .onDelete { indexSet in

                        let visitedPlaces =
                            places.filter { $0.visited }
                        for index in indexSet {
                            let placeToDelete =
                                visitedPlaces[index]
                            if let realIndex =
                                places.firstIndex(
                                    where: {
                                        $0.id == placeToDelete.id
                                    }
                                ) {
                                places.remove(
                                    at: realIndex
                                )
                            }
                        }
                    }
                }

                Section("À découvrir 📍") {
                    ForEach(
                        places.filter { !$0.visited }
                    ) { place in
                        NavigationLink {
                            PlaceDetailView(place: place)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(place.city)
                                    .font(.headline)
                                Text(place.country)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        let placesToVisit =
                            places.filter {
                                !$0.visited
                            }
                        for index in indexSet {
                            let placeToDelete =
                                placesToVisit[index]
                            if let realIndex =
                                places.firstIndex(
                                    where: {
                                        $0.id == placeToDelete.id
                                    }
                                ) {
                                places.remove(
                                    at: realIndex
                                )
                            }
                        }
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
