//
//  Places.swift
//  CarnetDeVoyage
//
//  Created by Manon  on 08/06/2026.
//

import SwiftUI

struct Place: Identifiable {
    let id = UUID()
    var city: String
    var country: String
    var visited: Bool
    var rating: Int
    var famousFood: String
    var imageName: String
    
    
    static let examples: [Place] = [
        Place(city: "Cracovie", country: "Pologne", visited: true, rating: 5, famousFood: "Pierogi", imageName: "krakow"),
        Place(city: "Nouméa", country: "Nouvelle-Calédonie", visited: true, rating: 5, famousFood: "Bougna", imageName: "noumea"),
        Place(city: "Oslo", country: "Norvège", visited: true, rating: 5, famousFood: "Lutefisk", imageName: "oslo"),
        Place(city: "Rome",country: "Italie", visited: true, rating: 5, famousFood: "Carbonara", imageName: "rome"),
        Place(city: "Katmandou", country: "Népal", visited: false, rating: 0, famousFood: "Momo", imageName: "katmandou"),
        Place(city: "San Juan", country: "Porto Rico", visited: false, rating: 0, famousFood: "Mofongo", imageName: "sanjuan")
    ]
}
