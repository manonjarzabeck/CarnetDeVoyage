//
//  AddPlace.swift
//  CarnetDeVoyage
//
//  Created by Manon  on 08/06/2026.
//

import SwiftUI

struct AddPlace: View {

    @Environment(\.dismiss)
    private var dismiss

    var body: some View {

        NavigationStack {
            Form {
                TextField(
                    "Ville",
                    text: .constant("")
                )
                TextField(
                    "Pays",
                    text: .constant("")
                )
            }
            .navigationTitle("Ajouter un lieu")
            .toolbar {
                ToolbarItem(
                    placement: .topBarLeading
                ) {
                    Button("Fermer") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddPlace()
}
